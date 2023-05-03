package com.kh.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.faq.model.service.FAQService;

/**
 * Servlet implementation class FAQupdateController
 */
@WebServlet("/updateF.fo")
public class FAQupdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQupdateController() {
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
		
		
		String content = request.getParameter("content");
		//System.out.println(content);
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		//System.out.println(faqNo);
		
		int result = new FAQService().updateFAQ(content,faqNo);
		
		
		response.setContentType("json/application; charset=UTF-8");
		response.getWriter().print(result);
		
		
	}

}
