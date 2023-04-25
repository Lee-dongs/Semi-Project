package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberReadReplyController
 */
@WebServlet("/ReadDoc.me")
public class MemberReadReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReadReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCount = -1;
		int rCount = -1;
		int qCount = -1;
//		System.out.println(request.getParameter("boardNo"));
//		게시글 댓글 읽음 메소드
		if(request.getParameter("boardNo")!=null) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
//			System.out.println(boardNo);
			int result = new MemberService().ReadBoardReply(boardNo);
			if(result>0) {
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("loginUser");
				int userId = m.getUserNo();
				//남은 게시글 댓글 개수 세는 메소드
				bCount = new MemberService().CountBoardReply(userId);
			}else {
				request.setAttribute("errorMsg", "댓글을 읽어오는데 오류가 발생했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		//카페 요청글 댓글 읽음 메소드
		if(request.getParameter("requestNo")!=null) {
			int requestNo = Integer.parseInt(request.getParameter("requestNo"));
//			System.out.println(requestNo);
			int result = new MemberService().ReadRequestReply(requestNo);
			if(result>0) {
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("loginUser");
				int userId = m.getUserNo();
				//남은 요청글 댓글 개수 세는 메소드 
				rCount = new MemberService().CountRequestReply(userId);
			}else {
				request.setAttribute("errorMsg", "댓글을 읽어오는데 오류가 발생했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		//질문글 댓글 읽음 메소드
		if(request.getParameter("questionNo")!=null) {
			int questionNo = Integer.parseInt(request.getParameter("questionNo"));
//			System.out.println(questionNo);
			int result = new MemberService().ReadQuestionReply(questionNo);
			if(result>0) {
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("loginUser");
				int userId = m.getUserNo();
				//남은 질문글 댓글 세는 메소드
				qCount = new MemberService().CountQuestionReply(userId);
			}else {
				request.setAttribute("errorMsg", "댓글을 읽어오는데 오류가 발생했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		JSONArray jArr = new JSONArray();
		jArr.add(bCount);
		jArr.add(rCount);
		jArr.add(qCount);
		response.setContentType("json/application; charset=UTF-8");
		response.getWriter().print(jArr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
