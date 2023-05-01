package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.Attachment;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		// 메인페이지 pull한 뒤 키값 확인하기

		
		Member loginUser = new MemberService().longinMember(userId, userPwd);

		
		if(loginUser == null) { // 로그인실패
			request.getSession().setAttribute("alertMsg", "로그인 정보를 다시 확인해주세요");
			response.sendRedirect(request.getHeader("Referer"));
		}else {
			// 로그인성공시 프로필사진 첨부파일 가져오기
			Attachment at = new MemberService().selectAttachment(userId);
			//System.out.println(at);
			
			request.getSession().setAttribute("profileAt", at);
			request.getSession().setAttribute("loginUser", loginUser);
			request.getSession().setAttribute("alertMsg", "성공적으로 로그인되었습니다.");
			if(userId.equals("admin")) {
				request.getRequestDispatcher("views/manager/managerMain.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getHeader("Referer"));
			}
			
		}
		
		
		
	}

}
