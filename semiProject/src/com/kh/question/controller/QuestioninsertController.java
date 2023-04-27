package com.kh.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question;

/**
 * Servlet implementation class QuestioninsertController
 */
@WebServlet("/insert.qo")
public class QuestioninsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestioninsertController() {
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
		
		String title =request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		Question q = new Question();
		q.setQuestionTitle(title);
		q.setContent(content);
		q.setQuestionWriter(userNo);
		
		int result = new QuestionService().insertQuestion(q);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/list.fo?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "문의글 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
