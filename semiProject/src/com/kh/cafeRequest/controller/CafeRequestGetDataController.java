package com.kh.cafeRequest.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cafeRequest.model.service.CafeRequestService;
import com.kh.cafeRequest.model.vo.Cafe;
import com.kh.cafeRequest.model.vo.CafeRequestAttachment;

import com.kh.common.NaverBlogSearch;
import com.kh.common.NaverBlogSearch.SearchResult;
import com.kh.common.NaverCafeInfo;
import com.kh.common.NaverCafeInfo.CafeInfo;
import com.kh.common.NaverCafeMenu;
import com.kh.common.NaverCafeMenu.CafeMenu;




/**
 * Servlet implementation class CafeRequestGetDataController
 */
@WebServlet("/getData.co")
public class CafeRequestGetDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeRequestGetDataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cafeName = request.getParameter("cafename");
		int requestNo = Integer.parseInt(request.getParameter("requestno"));
		String address = request.getParameter("cafeaddress");
		String[] str = address.split(" ");
		String search = str[1] +" "+ cafeName;
		System.out.println(search);
		ArrayList<SearchResult> sList = new ArrayList<>();
		try{
			sList = NaverBlogSearch.search(search);
		}catch(IOException e) {
//			System.err.println("Error scraping search results: " + e.getMessage());
		}
		CafeRequestAttachment cAt = null;
		cAt = new CafeRequestService().selectCafeRequestAttachment(requestNo);
		response.setContentType("json/application; charset=UTF-8");
		List list = new ArrayList();
		list.add(sList);
		list.add(cAt);
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String address = request.getParameter("cafeaddress");
		String cafename = request.getParameter("cafename");
		String[] str = address.split(" ");
		String search = str[2] + cafename;
		ArrayList<CafeMenu> menuList = new ArrayList<>();

		//카페 메뉴 정보가져오기
		menuList = NaverCafeMenu.NaverSearch(search);
//		System.out.println(menuList);
		
		CafeInfo ci = NaverCafeInfo.NaverSearch(search);
		
		List list = new ArrayList();
		list.add(menuList);
		list.add(ci);
//		System.out.println(list);
		response.setContentType("json/application; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
	}

}
