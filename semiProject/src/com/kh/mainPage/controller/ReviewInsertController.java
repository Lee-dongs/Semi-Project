package com.kh.mainPage.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mainPage.model.service.MainPageService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.cfre")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
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
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int userNo = m.getUserNo(); //댓글작성자
		
		boolean check = new MainPageService().checkReview(userNo);
		/*
		if(check) {
			request.getSession().setAttribute("alertMsg", "리뷰는 한번만 작성할 수 있습니다. 리뷰를 수정하시거나 삭제 후 다시 시도해주세요.");
			String before = request.getHeader("Referer");
			response.sendRedirect(before);
		}else {
			int cafeNo = Integer.parseInt(request.getParameter("cafeNo")); //참조하는 카페 번호		
			String content = request.getParameter("reviewText");//리뷰(댓글)내용
			
			int result = new MainPageService().insertReview(cafeNo, userNo, content);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "리뷰 작성 완료");
				String before = request.getHeader("Referer");
				response.sendRedirect(before);
			}else {
				request.getSession().setAttribute("alertMsg", "리뷰 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		*/
		int cafeNo = Integer.parseInt(request.getParameter("cafeNo")); //참조하는 카페 번호		
		String content = request.getParameter("reviewText");//리뷰(댓글)내용
		
		int result = new MainPageService().insertReview(cafeNo, userNo, content);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "리뷰 작성 완료");
			String before = request.getHeader("Referer");
			response.sendRedirect(before);
		}else {
			request.getSession().setAttribute("alertMsg", "리뷰 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
}
