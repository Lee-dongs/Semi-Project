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
		
		String userName = request.getParameter("nickname"); // 카카오닉네임을 이름으로 설정
		String userPwd = Integer.toString((int) (Math.random()*1000));// 카카오 로그인은 비밀번호가 없는데 DB 제약조건이 not null이라 난수로 설정
		String email = request.getParameter("email"); // 카카오 계정 이메일 사용
		String birth = request.getParameter("birthday"); // 출생년도는 비공개정보로, 가져올 수 없음. ("0521"의 형태로 출력)
		String userId = "kakao_" + email.substring(0,email.indexOf("@")); // 카카오계정 이메일로 아이디 사용
		
		// 아이디 특이사항 : 기존 회원과 구분하고 unique조건 충족 위해 카카오 유저는 kakao_xxx로 아이디 설정
				
		Member loginUser = new Member(userId, userPwd, userName, email, birth);
		
		int count = new MemberService().checkId(userId); // 이미 로그인 한 적 있는 카카오 유저인지 조회
		
		int result = 0;
		
		if(count > 0) { // 과거에 로그인했던 카카오 유저라면
			result = 1;
		}else { // 첫 카카오로그인이라면 DB에 새로 정보 담기
			result = new MemberService().kakaoLoginMember(loginUser);
		}
		
		
		if(result > 0) { // 로그인 성공
			request.getSession().setAttribute("loginUser", loginUser);
			request.getSession().setAttribute("alertMsg", "카카오로그인에 성공했습니다.");
			
			response.sendRedirect(request.getHeader("Referer")); // 로그인해도 기존에 보던 화면 유지
		}else {
			request.getSession().setAttribute("alertMsg", "로그인 정보를 다시 확인해주세요");
			response.sendRedirect(request.getHeader("Referer"));
		}
		
		
		
		
	}

}
