package com.kh.mainPage.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mainPage.model.service.MainPageService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CafeEvaluateController
 */
@WebServlet("/evaluate.cf")
public class CafeEvaluateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeEvaluateController() {
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
		
		int rating = Integer.parseInt(request.getParameter("rating"));
		int rating2 = Integer.parseInt(request.getParameter("rating2"));
		int rating3 = Integer.parseInt(request.getParameter("rating3"));
		int rating4 = Integer.parseInt(request.getParameter("rating4"));
		
		int cafeNo = Integer.parseInt(request.getParameter("cafeNo"));
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		String add = (String)request.getParameter("add");

		
		int userNo = m.getUserNo();
		String encodedParam = URLEncoder.encode(add, "UTF-8"); //받은 주소(add)를 인코딩 해줘야 리다이렉트가 정상적으로 작동된다.

		ArrayList<Integer> list = new ArrayList<>();
		list.add(rating);
		list.add(rating2);
		list.add(rating3);
		list.add(rating4);
		
		int result = new MainPageService().insertScore(cafeNo, userNo, list);

		if(result>0) {
			request.getSession().setAttribute("alertMsg", "평가완료");
			response.sendRedirect(request.getContextPath()+"/detail.cf?add="+encodedParam);
		}else {
			request.getSession().setAttribute("alertMsg", "평가실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
