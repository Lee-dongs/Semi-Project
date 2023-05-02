package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question_Reply;

/**
 * Servlet implementation class QuestionReplyListController
 */
@WebServlet("/selectReList.qo")
public class QuestionReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionReplyListController() {
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
		int questionNo = Integer.parseInt(request.getParameter("questionNNo"));
		
		ArrayList<Question_Reply> list = new QuestionService().selectReList(questionNo);
		//System.out.println(list);
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
		
		
	}

}
