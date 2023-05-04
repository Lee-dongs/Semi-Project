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
 * Servlet implementation class UpdateMemberProfile
 */
@WebServlet("/updateProfile.me")
public class UpdateMemberProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 원래 없었으면 새로 등록
		// 원래 있었으면 기존 사진 지우고 등록
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_files/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			Attachment profileAt = (Attachment)request.getSession().getAttribute("profileAt");
			
			// 새로 전달된 사진이 있는 경우
			Attachment newProfileAt = null;
			if(multiRequest.getOriginalFileName("updateProfile") != null) { // 새로 첨부하면
				
				newProfileAt = new Attachment();
				newProfileAt.setOriginName(multiRequest.getOriginalFileName("updateProfile"));
				newProfileAt.setChangeName(multiRequest.getFilesystemName("updateProfile"));
				newProfileAt.setFilePath("/resources/profile_files");
			
				if(profileAt != null) {// 기존에 프로필 있었으면
					// 기존파일번호 가져가서 지우고 새로 update 해야지
					newProfileAt.setFileNo(Integer.parseInt(multiRequest.getParameter("fileNo"))); 
					
					// 기존 첨부파일 삭제하기
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
									
				}else {
					// 기존에 프로필이 없었는데, 새로 등록하는 경우
					// 회원번호로 새로 등록해주기
					newProfileAt.setRefBno(loginUser.getUserNo());
				}

				int result = new MemberService().updateAttachment(loginUser, newProfileAt); // 프로필 삽입 또는 업데이트
				
				if (result > 0) {
					response.setContentType("json/application ; chatset=UTF-8");
					request.getSession().setAttribute("profileAt", newProfileAt); // 세션 업데이트
					response.getWriter().print("프로필 사진을 수정했습니다.");
					
				} else {
					response.getWriter().print("프로필 사진을 수정하지 못했습니다.");
				}
			}else { // 수정사항 없이 submit누르면
				response.setContentType("text/html; charset=UTF-8" );
				response.getWriter().print("수정사항이 없습니다.");
			}

		}	
		
	}

}
