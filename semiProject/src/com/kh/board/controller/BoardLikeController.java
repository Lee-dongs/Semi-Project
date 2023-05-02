package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Like;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardLikeController
 */
@WebServlet("/like.bo")
public class BoardLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		int result = 0;
		result = new BoardService().chkUserLike(uno,bno);
		
		if(result>0) {
			result = new BoardService().deleteLike(uno,bno)-1;
			response.setContentType("json/application; charset=UTF-8");
			response.getWriter().print(result);
		}else {
			result = new BoardService().insertLike(bno, uno);
			response.setContentType("json/application; charset=UTF-8");
			response.getWriter().print(result);
		}
		
		
	
	}

}
