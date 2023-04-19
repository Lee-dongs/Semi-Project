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
 * Servlet implementation class KakaoLoginController
 */
@WebServlet("/kakao-login.me")
public class KakaoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("nickname");
		String userPwd = Integer.toString((int) (Math.random()*1000));// 카카오 로그인은 비밀번호가 없는데 db는 notnull이라 난수로 설정
		String email = request.getParameter("email");
		String birth = request.getParameter("birthday");
		String userId = email.substring(0,email.indexOf("@")); // 카카오계정 이메일로 아이디 사용
				
		System.out.println(userName);
		System.out.println(userPwd);
		System.out.println(email);
		System.out.println(birth);
		System.out.println(userId);
		
		Member m = new Member(userId, userPwd, userName, email, birth);
		
		int result = new MemberService().kakaoLoginMember(m);
		
		
		
		
	}

}
