package com.kh.mainPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mainPage.model.service.MainPageService;
import com.kh.mainPage.model.vo.Cafe;
import com.kh.mainPage.model.vo.CafeAttachment;

/**
 * Servlet implementation class CafeRankingController
 */
@WebServlet("/ranking.cf")
public class CafeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");		
		request.setAttribute("location", location);
		
		ArrayList<Cafe> list = new MainPageService().selectCafeList(location); //카페 리스트 조회		
		list = new MainPageService().selectCafeScore(list); //카페 평점 조회	
		list = new MainPageService().countReply(list); //카페 리뷰수 조회
		
		ArrayList<CafeAttachment> cfatList = new MainPageService().selectAttachmentList(list);//대문 이미지 조회
		
		request.setAttribute("cfatList", cfatList);
		request.setAttribute("status", "default"); //카페 정렬 상태(초기값 default)
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/mainPage/rankingPage.jsp").forward(request, response); //랭킹 페이지로 포워드
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
