package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Location;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Location> list = new BoardService().selectLocation();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/board/boardEnrollForm.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_files/");
			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize,"UTF-8",
														new MyFileRenamePolicy());
															
			String location = mr.getParameter("location");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String boardWriter = mr.getParameter("userNo");
			Board b = new Board();
			b.setLocationCode(location);
			b.setTitle(title);
			b.setContent(content);
			b.setBoardWriter(boardWriter);
			
			
			Attachment at = null;
			
			if(mr.getOriginalFileName("upfile")!=null) {
				at = new Attachment();
				at.setOriginName(mr.getOriginalFileName("upfile"));
				at.setChangeName(mr.getFilesystemName("upfile"));
				at.setFilePath("/resources/board_files");
			}
			int result = new BoardService().insertBoard(b,at);
			
			if(result>0) {
				response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1&sort=1");
			}else {
				if(at!=null) {
					new File(savePath+at.getChangeName()).delete();
				}
			}
		}
	
	}

}
