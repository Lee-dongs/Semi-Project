package com.kh.cafeRequest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cafeRequest.model.service.CafeRequestService;
import com.kh.cafeRequest.model.vo.CafeRequest;
import com.kh.cafeRequest.model.vo.CafeRequestAttachment;

/**
 * Servlet implementation class CafeRequestAcceptPageController
 */
@WebServlet("/cafeRequestAccept.co")
public class CafeRequestAcceptPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeRequestAcceptPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CafeRequest> cList = new ArrayList<>();
		cList = new CafeRequestService().selectCafeRequest();
		ArrayList<CafeRequestAttachment> aList = new ArrayList<>();
		aList = new CafeRequestService().selectRequestAttachmentNo();
		
		if(cList!=null) {
			request.setAttribute("cList", cList);
			request.setAttribute("aList", aList);
			request.getRequestDispatcher("views/CafeRequest/cafeEnrollPage.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "요청 페이지로딩 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
