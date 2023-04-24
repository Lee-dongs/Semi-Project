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
		
		int cafeNo = Integer.parseInt(request.getParameter("cafeNo")); //참조하는 카페 번호
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int userNo = m.getUserNo(); //댓글작성자
		
		String content = request.getParameter("reviewText");//리뷰(댓글)내용
		
		String add = request.getParameter("add"); //리다이렉트 할 주소 받아오기
		String encodedParam = URLEncoder.encode(add, "UTF-8"); //인코딩 해주기
		
		int result = new MainPageService().insertReview(cafeNo, userNo, content);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "리뷰 작성 완료");
			response.sendRedirect(request.getContextPath() + "/detail.cf?add="+encodedParam);
		}else {
			request.getSession().setAttribute("alertMsg", "리뷰 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
