package com.kh.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.pageInfo;
import com.kh.faq.model.service.FAQService;
import com.kh.faq.model.vo.FAQ;
import com.kh.member.model.vo.Member;
import com.kh.question.model.service.QuestionService;
import com.kh.question.model.vo.Question;

/**
 * Servlet implementation class searchQuestionController
 */
@WebServlet("/search.qo")
public class searchQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchQuestionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 질문글 검색
		String category = request.getParameter("category");
		String searchText = request.getParameter("searchText");
		
		int listCount; //현재 총 게시글 개수
		int currentPage; //현재페이지
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대개수
		int questionLimit; //한페이지에서 보여질 게시글 최대 개수
		int maxPage; // 가장 마지막페이지가 몇인지
		int startPage; //페이지 하단에 보여질 페이지바의 시작수
		int endPage; //페이지 하단에 보여질 페이징바의 끝수
		
		listCount = new QuestionService().searchListCount(category,searchText);
		//System.out.println(listCount);
	
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		
		questionLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/questionLimit);
		
		startPage = (currentPage-1)/pageLimit*pageLimit +1;
		
		endPage = startPage+pageLimit -1;
		
	
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		pageInfo spi = new pageInfo(listCount, currentPage, pageLimit, questionLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Question> qlist = new QuestionService().searchQuestion(category,searchText,spi);
		request.setAttribute("category", category);
		request.setAttribute("searchText", searchText);
		request.setAttribute("slist", qlist);
		request.setAttribute("spi", spi);
		
		//자주묻는 질문
		
		ArrayList<FAQ> list = new FAQService().selecList();
		request.setAttribute("list", list);
		
		//보내기
		request.getRequestDispatcher("views/faq/faquestionView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
