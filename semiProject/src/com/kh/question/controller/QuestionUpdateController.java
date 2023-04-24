package com.kh.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question;

/**
 * Servlet implementation class QuestionUpdateController
 */
@WebServlet("/update.qo")
public class QuestionUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int questionNo = Integer.parseInt(request.getParameter("qqo"));
		
		Question qq = new QuestionService().seletQuestion(questionNo);			
		System.out.println(qq);
		request.setAttribute("question", qq);
		
		
		request.getRequestDispatcher("views/question/questionUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int questionNo = Integer.parseInt(request.getParameter("qqo"));
		String title =request.getParameter("quTitle");
		String content = request.getParameter("quContent");
		
		Question q = new Question();
		q.setQuestionNo(questionNo);
		q.setQuestionTitle(title);
		q.setContent(content);
		
		int result = new QuestionService().updateQuestion(q);
		
		if(result>0) {
						
			response.sendRedirect(request.getContextPath()+"/list.fo?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "문의글 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
