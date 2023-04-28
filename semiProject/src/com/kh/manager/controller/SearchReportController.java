package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.pageInfo;
import com.kh.manager.model.service.ManagerService;
import com.kh.manager.model.vo.Report;

/**
 * Servlet implementation class SearchReportController
 */
@WebServlet("/searchReport.ma")
public class SearchReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 // report관리페이지 검색기능 서블릿
		
		int listCount; //현재 총 게시글 개수
		int currentPage; //현재페이지
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대개수
		int boardLimit; //한페이지에서 보여질 게시글 최대 개수
		int maxPage; // 가장 마지막페이지가 몇인지
		int startPage; //페이지 하단에 보여질 페이지바의 시작수
		int endPage; //페이지 하단에 보여질 페이징바의 끝수
	
		String keyword = request.getParameter("keyword"); // 검색할 내용
		String searchBy = request.getParameter("searchBy"); // '아이디'또는 '상세신고내용'로 검색
		
		listCount = new ManagerService().searchReportListCount(keyword, searchBy);
	
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit*pageLimit +1;
		
		endPage = startPage+pageLimit -1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		pageInfo pi = new pageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		//System.out.println(pi);
	
		// 검색 카테고리가 '아이디'일 경우 member테이블 조회 - 신고많은 순
		// 검색 카테고리가 '상세신고내용'일 경우 report테이블 조회 - 신고많은 순
		
		ArrayList<Report> list = new ManagerService().searchReport(pi, keyword, searchBy);
		
		// 댓글창에 검색어 남아있게 하기위해 다시 검색할 내용과 카테고리 전달
		request.setAttribute("keyword", keyword);
		request.setAttribute("searchBy", searchBy);
				
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/manager/reportManagementPage.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
