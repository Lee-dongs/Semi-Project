package com.kh.mainPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mainPage.model.service.MainPageService;
import com.kh.mainPage.model.vo.Cafe;

/**
 * Servlet implementation class SortByScoreController
 */
@WebServlet("/sbScore.cf")
public class SortByScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortByScoreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		
		ArrayList<Cafe> list = new MainPageService().selectCafeList(location); //카페 리스트 조회
		
		list = new MainPageService().selectCafeScore(list); //카페 평점 조회
		
		list = new MainPageService().countReply(list); //카페 리뷰수 조회
		
		Collections.sort(list, new Comparator<Cafe>() {
			public int compare(Cafe a, Cafe b) {
				if(a.getScore() == b.getScore()) {
					return a.getCafeName().compareTo(b.getCafeName());//평점이 같다면 카페 이름 사전순으로 정렬
				}
				return Double.compare(b.getScore(), a.getScore());//평점이 높은것부터 정렬
			}
		});
		request.setAttribute("status", "score");
		request.setAttribute("list", list);
		request.setAttribute("location", location);	
		request.getRequestDispatcher("views/mainPage/rankingPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
