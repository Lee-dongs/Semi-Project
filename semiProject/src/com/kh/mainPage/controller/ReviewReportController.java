package com.kh.mainPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.mainPage.model.service.MainPageService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReviewReportController
 */
@WebServlet("/insert.rp")
public class ReviewReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewReportController() {
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
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String reportWriter = m.getUserId();
		
		int result = new MainPageService().insertReport(userId, category, content, reportWriter);
		
		String alertMsg = "";
		if(result>0) {
			alertMsg = "성공적으로 신고하였습니다.";
		}else {
			alertMsg = "신고도중 오류가 발생하였습니다.";
		}
		
		response.setContentType("java/application; charset=UTF-8");
		new Gson().toJson(alertMsg, response.getWriter());
	}

}
