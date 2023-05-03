package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Like;
import com.kh.board.model.vo.unLike;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int uno = loginUser.getUserNo();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		request.setAttribute("bno", bno);
		int result = new BoardService().increaseCount(bno);
		
		if(result>0) {
			Board b = new BoardService().selectBoard(bno);
			Attachment at = new BoardService().selectAttachment(bno);
			Like l = new BoardService().likeSelectList(bno, uno);
			unLike ul = new BoardService().selectUnLikeList(bno, uno);
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			request.setAttribute("l", l);
			request.setAttribute("ul", ul);
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
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
