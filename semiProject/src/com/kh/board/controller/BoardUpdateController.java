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
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		ArrayList<Location> list = new BoardService().selectLocation();
		Board b = new BoardService().selectBoard(bno);
		Attachment at = new BoardService().selectAttachment(bno);
			request.setAttribute("list", list);
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/board/boardUpdateView.jsp").forward(request, response);
			
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
			
			int bno = Integer.parseInt(mr.getParameter("bno"));
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String location = mr.getParameter("location");
			
			Board b = new Board();
			b.setLocationCode(location);
			b.setBoardNo(bno);
			b.setTitle(title);
			b.setContent(content);
			
			Attachment at = null;
			if(mr.getOriginalFileName("reUp")!=null) {
				at= new Attachment();
				at.setOriginName(mr.getOriginalFileName("reUp"));
				at.setChangeName(mr.getFilesystemName("reUp"));
				at.setFilePath("/resources/board_files");
				
				if(mr.getParameter("fileNo")!=null) {
					at.setFileNo(Integer.parseInt(mr.getParameter("fileNo")));
					new File(savePath+mr.getParameter("changeName")).delete();
				}else {
					at.setRefBno(bno);
				}
			}
			
			int result = new BoardService().updateBoard(b,at);
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "게시글 수정되었습니다.");
				response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+bno);
			}
		}
	}
}
