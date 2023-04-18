package com.kh.cafeRequest.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cafeRequest.model.service.CafeRequestService;
import com.kh.cafeRequest.model.vo.Cafe;

/**
 * Servlet implementation class CafeRequestAddressCheckController
 */
@WebServlet("/AddressCheck.bo")
public class CafeRequestAddressCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeRequestAddressCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //ajax 카페주소 확인 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cafeAddress = request.getParameter("cafeaddress");
		
		//카페주소 정보 확인
//		System.out.println(cafeAddress);
		Cafe cafe = null;
		cafe = new CafeRequestService().findCafeAddress(cafeAddress);
		
		if(cafe!=null && cafe.getCafeName()!=null) {
			String result = "NNNNN";
			response.getWriter().print(result);
		}else {
			String result = "NNNNY";
			response.getWriter().print(result);
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
