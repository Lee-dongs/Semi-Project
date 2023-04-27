package com.kh.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question_Reply;

/**
 * Servlet implementation class QuestionListController
 */
@WebServlet("/insertRe.qo")
public class QuestionReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionReplyController() {
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
		
		int questionNo = Integer.parseInt(request.getParameter("questionNNo"));
		//System.out.println(questionNo);
		
		String content = request.getParameter("content");
		//System.out.println(content);
		
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int userNo = loginUser.getUserNo();
		//System.out.println(userNo);
		
		Question_Reply re = new Question_Reply();
		re.setRefBno(questionNo);
		re.setReplyContent(content);
		re.setReplyWriter(String.valueOf(userNo));
		
		int result = new QuestionService().questionReply(re);
		//System.out.println(result);
		response.getWriter().print(result);
	}

}
