package com.kh.mainPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mainPage.model.service.MainPageService;
import com.kh.mainPage.model.vo.Cafe;
import com.kh.mainPage.model.vo.CafeAttachment;

/**
 * Servlet implementation class CafeDetailViewController
 */
@WebServlet("/detail.cf")
public class CafeDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		String address = request.getParameter("add");

		int result = new MainPageService().increaseCount(address);
		
		if(result>0) {
			Cafe cafe = new MainPageService().selectCafeInfo(address); //카페 정보 가져오기
			
			cafe = new MainPageService().countScore(cafe);
			
			ArrayList<Cafe> cafeList = new ArrayList<>();
			cafeList.add(cafe); //굳이 arraylist에 추가하는 이유는 카페 평점, 리뷰 개수 가져오는 메서드가 arraylist를 리턴하기때문
			
			cafeList = new MainPageService().selectCafeScore(cafeList); //카페 평점 가져오기
			
			cafeList = new MainPageService().countReply(cafeList); //카페 리뷰 개수 가져오기
			
			int cafeFileNo = new MainPageService().selectAttachmentList(cafeList).get(0).getCafeFileNo();
			
			String titleChangeName = new MainPageService().selectTitleChangeName(cafe.getCafeNo());
			
			ArrayList<CafeAttachment> detailAtList = new MainPageService().selectDetailAtList(cafe.getCafeNo()); //해당 카페의 디테일 이미지 가져오기
			
			LinkedHashMap<String, Integer> map = new MainPageService().selectMenu(cafeList.get(0).getCafeNo()); //map으로 메뉴, 가격 저장
			
			request.setAttribute("location", location);
			request.setAttribute("add", address);
			request.setAttribute("cafeFileNo", cafeFileNo);
			request.setAttribute("titleChangeName", titleChangeName);
			request.setAttribute("detailAtList", detailAtList);	
			request.setAttribute("menu", map);
			request.setAttribute("cafe", cafeList.get(0));
		}
		
		request.getRequestDispatcher("views/mainPage/cafeDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
