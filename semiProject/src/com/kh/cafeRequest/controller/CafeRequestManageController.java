package com.kh.cafeRequest.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.kh.board.model.vo.Attachment;
import com.kh.cafeRequest.model.service.CafeRequestService;
import com.kh.cafeRequest.model.vo.Cafe;
import com.kh.cafeRequest.model.vo.CafeAttachment;
import com.kh.cafeRequest.model.vo.CafeMenu;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
/**
 * Servlet implementation class CafeRequestManageController
 */
@WebServlet("/manageCafe.co")
public class CafeRequestManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeRequestManageController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no2");
		String content = request.getParameter("sorry");
		ArrayList<Integer> requestNos = new ArrayList();
		
		if(no.contains(",")) {
			String[] list = no.split(",");
			for(int i=0; i<list.length;i++) {
				requestNos.add(Integer.parseInt(list[i]));
			}
		}else{
			requestNos.add(Integer.parseInt(no));
		}
		int result = 1;
		//리쿼스트 답변
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		int writerNo = m.getUserNo();
		result *= new CafeRequestService().replyCafeRequest(requestNos,content,writerNo);
		
		//리쿼스트 삭제
		result *= new CafeRequestService().delectCafeRequest(requestNos);
			
		//첨부파일 삭제
		if(request.getParameter("no2-3")!="") {
			String rno = request.getParameter("no2-3");
			ArrayList<Integer> attachNos = new ArrayList();
			if(rno.contains(",")) {
				String[] aList = rno.split(",");
				for(int i=0; i<aList.length;i++) {
					attachNos.add(Integer.parseInt(aList[i]));
				}
			}else {
				attachNos.add(Integer.parseInt(rno));
			}
			result *= new CafeRequestService().delectCafeRequestAttachment(attachNos);
		}
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "요청글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath()+"/cafeRequestAccept.co");
		}else {
			request.setAttribute("errorMsg", "게시글 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/cafe_files/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,"UTF-8",
														new MyFileRenamePolicy());
															
			String location = multiRequest.getParameter("location3");
			String cafename = multiRequest.getParameter("cafename3");
			String restTime = multiRequest.getParameter("rest3");
			String operationTime = multiRequest.getParameter("time3")+"-"+multiRequest.getParameter("time3-1");
			String phone = multiRequest.getParameter("phone3");
			String address = multiRequest.getParameter("address3");
			Cafe c = new Cafe();
			String locationCode = new CafeRequestService().findCafeLocationCode(location);
			ArrayList<CafeAttachment> acList = new ArrayList<>();
			int result = 0;
			if(locationCode!=null) {
				c.setLocationCode(locationCode);
				c.setCafeName(cafename);
				if(restTime!="연중무휴") {
					c.setOffDay(restTime);
				}
				c.setOperationTime(operationTime);
				c.setPhone(phone);
				c.setAddress(address);
				
				
				ArrayList<CafeMenu> cmList = new ArrayList<>();
				for(int i=0; i<5;i++) {
					CafeMenu cm = new CafeMenu();
					if(Integer.parseInt(setIntData(multiRequest.getParameter("price"+i)))!=0) {
						cm.setMenuName(multiRequest.getParameter("menu"+i));
						cm.setCafePrice(Integer.parseInt(setIntData(multiRequest.getParameter("price"+i))));
						cmList.add(cm);
					}
				}
				
				
				CafeAttachment cAt = null;
				
				if(multiRequest.getOriginalFileName("image3")!=null) {
					cAt = new CafeAttachment();
					cAt.setType(1);
					cAt.setOriginName(multiRequest.getOriginalFileName("image3"));
					cAt.setChangeName(multiRequest.getFilesystemName("image3"));
					cAt.setFilePath("resources/cafe_files/");
					acList.add(cAt);
				}
				for(int i=0; i<5;i++) {
					if(multiRequest.getOriginalFileName("image3-"+i)!=null) {
						cAt = new CafeAttachment();
						cAt.setType(2);
						cAt.setOriginName(multiRequest.getOriginalFileName("image3-"+i));
						cAt.setChangeName(multiRequest.getFilesystemName("image3-"+i));
						cAt.setFilePath("resources/cafe_files/");
						acList.add(cAt);
					}
				}
				//카페 정보 넣기
				result = new CafeRequestService().insertCafe(c,cmList,acList);
			}else {
				result = -1;
			}
			
			if(result>0) {
				String no = multiRequest.getParameter("requestnos");
				String content = multiRequest.getParameter("content3");
				ArrayList<Integer> requestNos = new ArrayList();
				if(no.contains(",")) {
					if(Integer.parseInt(setIntData(multiRequest.getParameter("requestnos")))!=0) {
						String[] list = no.split(",");
						for(int i=0; i<list.length;i++) {
							requestNos.add(Integer.parseInt(list[i]));
						}
					}
				}else{
					if(Integer.parseInt(setIntData(multiRequest.getParameter("requestnos")))!=0) {
						requestNos.add(Integer.parseInt(no));
					}
				}
				int result1 = 1;
				//리쿼스트 답변
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("loginUser");
				int writerNo = m.getUserNo();
				result1 *= new CafeRequestService().replyCafeRequest(requestNos,content,writerNo);
				
				//리쿼스트 삭제
				result1 *= new CafeRequestService().delectCafeRequest(requestNos);
					
				//첨부파일 삭제
				if(Integer.parseInt(setIntData(multiRequest.getParameter("atnos")))!=0) {
					String attachnos = multiRequest.getParameter("atnos");
					ArrayList<Integer> attachNos = new ArrayList();
					if(attachnos.contains(",")) {
						String[] aList = attachnos.split(",");
						for(int i=0; i<aList.length;i++) {
							attachNos.add(Integer.parseInt(aList[i]));
						}
					}else {
						attachNos.add(Integer.parseInt(attachnos));
					}
					result *= new CafeRequestService().delectCafeRequestAttachment(attachNos);
				}
				
				if(result>0) {
					request.getSession().setAttribute("alertMsg", "요청글을 등록했습니다.");
					response.sendRedirect(request.getContextPath()+"/cafeRequestAccept.co");
				}else {
					request.setAttribute("errorMsg", "요청글을 등록실패했습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			}else if(result==0){
				for(CafeAttachment ca:acList) {
					if(ca!=null) {
						new File(savePath+ca.getChangeName()).delete();
					}
				}
				request.setAttribute("errorMsg", "요청 페이지로딩 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}else {
				for(CafeAttachment ca:acList) {
					if(ca!=null) {
						new File(savePath+ca.getChangeName()).delete();
					}
				}
				request.setAttribute("errorMsg", "지역이 잘못된 값입니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
	public String setIntData(String str) {
		
		if(str == null || str.equals("")) {
			return "0";
		}else {
			return str;
		}
	}
}