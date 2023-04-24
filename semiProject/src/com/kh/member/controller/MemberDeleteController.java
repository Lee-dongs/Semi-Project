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
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("mno");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String adminId = loginUser.getUserId();
		
		int result = 0;
		
		result = new MemberService().deleteMember(userId);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 탈퇴했습니다.");
			
			if(adminId.equals("admin")) { // 관리자계정이라면 회원관리페이지로
				response.sendRedirect(request.getContextPath() + "/memberManagement.ma?currentPage=1");// 관리자가 회원관리페이지에서 회원탈퇴를 시켰을 때는 회원관리 페이지로이동
			}else { // 일반계정이라면 로그인정보 삭제 후 메인으로
			request.getSession().removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
			}
		}else {
			request.setAttribute("errorMsg", "탈퇴를 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
