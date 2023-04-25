package com.kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.manager.model.service.ManagerService;

/**
 * Servlet implementation class ReportMemberController
 */
@WebServlet("/report.ma")
public class ReportMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 신고내용 확인 후 신고하기 버튼 누르면 오는 서블릿
		
		String userId = request.getParameter("id");
		int reportNo = Integer.parseInt(request.getParameter("rno"));
		
		int result1 = new ManagerService().increaseReport(userId); //MEMBER테이블의 REPORT 증가
		int result2 = new ManagerService().updateReport(reportNo); //REPORT테이블의 STATUS변경
		
		if(result1 * result2 > 0) { // 둘 다 성공하면
			request.getSession().setAttribute("alertMsg", "신고작업이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/reportManagement.ma?currentPage=1");
		}else{
			request.setAttribute("errorMsg", "신고하기 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
