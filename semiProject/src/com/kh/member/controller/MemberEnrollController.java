package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

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
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userPwdCheck = request.getParameter("userPwdCheck");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth-year") + "/"
					+ request.getParameter("birth-month") + "/"
					+ request.getParameter("birth-day");
		
		Member m = new Member(userId, userPwd, userName, phone, email, address, birth);
		
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원가입 성공");
			response.sendRedirect(request.getContextPath()); // 메인페이지로
		}else {
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
		
		
	}

}
