package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Board;
import com.kh.member.model.vo.BoardReply;
import com.kh.member.model.vo.CafeRequest;
import com.kh.member.model.vo.CafeRequestReply;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.QuestionReply;

/**
 * Servlet implementation class MemberMyPage
 */
@WebServlet("/myPage.me")
public class MemberMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		
		//댓글이 있는 요청글 조회
		ArrayList<CafeRequest> cList = new MemberService().selectCafeRequestWith(userNo);
		//요청글 댓글 조회 메소드
		ArrayList<CafeRequestReply> crList = new MemberService().selectCafeReqeustReply(userNo); 
		
		//댓글이 있는 게시글 조회
		ArrayList<Board> bList = new MemberService().selectBoardWith(userNo);
		//게시글 댓글 조회
		ArrayList<BoardReply> brList = new MemberService().selectBoardReply(userNo);
		
		//댓글이 있는 질문글 조회
		ArrayList<Question> qList = new MemberService().selectQuestionWith(userNo);
		//질문글 댓글 조회
		ArrayList<QuestionReply> qrList = new MemberService().selectQuestionReply(userNo);
		
		
		request.setAttribute("cList", cList);
		request.setAttribute("bList", bList);
		request.setAttribute("qList", qList);
		request.setAttribute("crList", crList);
		request.setAttribute("brList", brList);
		request.setAttribute("qrList", qrList);
		request.getRequestDispatcher("/views/member/memberMyPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
