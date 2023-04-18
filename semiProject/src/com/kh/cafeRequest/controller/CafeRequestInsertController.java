package com.kh.cafeRequest.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.cafeRequest.model.service.CafeRequestService;
import com.kh.cafeRequest.model.vo.CafeRequest;
import com.kh.cafeRequest.model.vo.CafeRequestAttachment;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CafeRequestInsertController
 */
@WebServlet("/insertRequest.co")
public class CafeRequestInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeRequestInsertController() {
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
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/cafeRequest_files/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String cafeName = multiRequest.getParameter("cafename");
			String cafeAddress = multiRequest.getParameter("address");
			String operationTime = multiRequest.getParameter("operationTime");
			String content = multiRequest.getParameter("content");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));

			//데이터 넘어오는지 확인용
			System.out.println(cafeName +" "+ cafeAddress+" "+operationTime+" "+content+" "+userNo);
			
			CafeRequest cafeRe = new CafeRequest();
			cafeRe.setCafeName(cafeName);
			cafeRe.setAddress(cafeAddress);
			cafeRe.setOperationTime(operationTime);
			cafeRe.setContent(content);
			cafeRe.setRequestWriter(userNo);
			
			CafeRequestAttachment atRe = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				atRe = new CafeRequestAttachment();
				atRe.setOriginName(multiRequest.getOriginalFileName("upfile")); 
				atRe.setChangeName(multiRequest.getFilesystemName("upfile"));
				atRe.setFilePath("/resources/cafeRequest_files");
			}
			
			int result = new CafeRequestService().insertCafeRequest(cafeRe, atRe);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/cafeRequest.co");
			}else {
				
				if(atRe!=null) {
					
					new File(savePath+atRe.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

}
