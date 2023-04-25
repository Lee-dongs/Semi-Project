package com.kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.pageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberManagmentController
 */
@WebServlet("/memberManagement.ma")
public class MemberManagmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MemberManagmentController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징
		
		int listCount; //현재 총 게시글 개수
		int currentPage; //현재페이지
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대개수
		int boardLimit; //한페이지에서 보여질 게시글 최대 개수
		int maxPage; // 가장 마지막페이지가 몇인지
		int startPage; //페이지 하단에 보여질 페이지바의 시작수
		int endPage; //페이지 하단에 보여질 페이징바의 끝수
		
		listCount = new MemberService().selectListCount();
		//System.out.println(listCount); 나옴
	
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
		
		ArrayList<Member> list = new MemberService().selectMember(pi); // 회원정보 가져오기
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/manager/memberManagementPage.jsp").forward(request, response);// 회원관리 페이지로
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
