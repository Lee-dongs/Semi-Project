package com.kh.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 메뉴바 로그인모달에서 a 태그 회원가입을 누르면 회원가입 jsp페이지로 이동
		request.getRequestDispatcher("views/member/memberEnrollForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 jsp(memberEnrollForm.jsp)에서 폼 submit시 post방식으로 넘어 옴
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			// 프로필 저장 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_files/");
			// 파일명 변경
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userId = multiRequest.getParameter("inputUserId");
			String userPwd = multiRequest.getParameter("inputUserPwd");
			String userName = multiRequest.getParameter("userName");
			String phone = multiRequest.getParameter("phone");
			String email = multiRequest.getParameter("userEmail");
			String totalAddress = "";
			String postCode = multiRequest.getParameter("postCode");
			String address = multiRequest.getParameter("address");
			String detailAddress = multiRequest.getParameter("detailAddress");
			String extraAddress = multiRequest.getParameter("extraAddress");
			totalAddress = postCode +"/"+ address +"/"+detailAddress +"/"+ extraAddress;
			String birth = request.getParameter("birth");
			
			Member m = new Member(userId, userPwd, userName, phone, email, totalAddress, birth);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("profile")!=null) {//프로필있는경우
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("profile")); // 원본명
				at.setChangeName(multiRequest.getFilesystemName("profile")); // 업로드된 수정된 파일명
				at.setFilePath("/resources/profile_files");
			}
			
			int result = new MemberService().insertMember(m, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "회원가입 성공");
				response.sendRedirect(request.getContextPath()); // 메인페이지로
			}else {
				if(at != null) { // 첨부파일이 있었는데 회원가입 실패시
					new File(savePath + at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
			
		}
		
		
		
	}

}
