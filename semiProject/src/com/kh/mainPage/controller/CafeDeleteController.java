package com.kh.mainPage.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mainPage.model.service.MainPageService;

/**
 * Servlet implementation class CafeDeleteController
 */
@WebServlet("/delete.cf")
public class CafeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeDeleteController() {
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
		
		String location = request.getParameter("location");
		String add = request.getParameter("add");
		String encodedLocation = URLEncoder.encode(location, "UTF-8");
		
		int result = new MainPageService().deleteCafe(add);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 삭제했습니다");
			response.sendRedirect(request.getContextPath() + "/ranking.cf?location=" + encodedLocation);
		}else {
			request.getSession().setAttribute("alertMsg", "삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

}
