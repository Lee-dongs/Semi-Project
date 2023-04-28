package com.kh.mainPage.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.mainPage.model.service.MainPageService;
import com.kh.mainPage.model.vo.Cafe;
import com.kh.mainPage.model.vo.CafeAttachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CafeUpdateController
 */
@WebServlet("/update.cf")
public class CafeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		
		ArrayList<CafeAttachment> list = new ArrayList<>();

		if(ServletFileUpload.isMultipartContent(request)) {	
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_files/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int[] cafeFileNo = Stream.of(multiRequest.getParameterValues("cafeFileNo")).mapToInt(Integer::parseInt).toArray();
			String[] originFileName = multiRequest.getParameterValues("originFileName");

			for(int i=1; i<=6; i++) {
				String key = "modifyDetailImg"+i;

				if(multiRequest.getOriginalFileName(key) != null) {	
					CafeAttachment cafeAttachment = new CafeAttachment();
					cafeAttachment.setOriginName(multiRequest.getOriginalFileName(key));
					cafeAttachment.setChangeName(multiRequest.getFilesystemName(key));
					cafeAttachment.setFilePath("resources/board_files/");
					cafeAttachment.setCafeFileNo(cafeFileNo[i-1]);
					
					if(i==1) {
						cafeAttachment.setType(1); //대표이미지
					}else {
						cafeAttachment.setType(2); //상세이미지
					}

					list.add(cafeAttachment);
					
					new File(savePath+"/"+ originFileName[i-1]).delete();
				}
			}

			int cafeNo = Integer.parseInt(multiRequest.getParameter("cafeNo"));
			String modifyName = multiRequest.getParameter("modifyName"); //카페 이름
			String modifyAddress = multiRequest.getParameter("modifyAddress"); //카페 주소
			String modifyTime = multiRequest.getParameter("modifyTime"); //카페 영업시간
			String modifyTime_1 = multiRequest.getParameter("modifyTime-1"); //카페 영업시간
			String modifyRest = multiRequest.getParameter("modifyRest"); //카페 휴무일
			String modifyPhone = multiRequest.getParameter("modifyPhone"); //카페 전화번호
			
			String operationTime = modifyTime + " - " + modifyTime_1;
			
			Cafe cafe = new Cafe(cafeNo, modifyName, operationTime, modifyRest, modifyPhone, modifyAddress);
			
			
			String[] modifyFood = (multiRequest.getParameterValues("modifyFood")); //메뉴 이름
			int[] modifyPrice = Stream.of(setIntData(multiRequest.getParameterValues("modifyPrice"))).mapToInt(Integer::parseInt).toArray(); //메뉴 가격

			
			List<String> foodName = new ArrayList<>(Arrays.asList(multiRequest.getParameterValues("foodName")));
			
			for(int i=foodName.size(); i<5; i++) { //빈칸 채우기용
				foodName.add("");
			}

			LinkedHashMap<String, Integer> map = new LinkedHashMap<>();
			for(int i=0; i<modifyFood.length; i++) {
				map.put(modifyFood[i], modifyPrice[i]);
			}
		
			
			int result = new MainPageService().updateCafeAttachment(list, cafe, foodName, map);
			String[] newPath = request.getHeader("Referer").split("add");
			String newUrl = newPath[0] + "add=" + URLEncoder.encode(modifyAddress,"UTF-8");
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "카페 정보를 수정하셨습니다.");
				response.sendRedirect(newUrl);
			}else {
				request.getSession().setAttribute("alertMsg", "카페 정보 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
	}
	
	public String setData(String str) { //null처리
		
		if(str == null) {
			return "";
		}else {
			return str;
		}
	}
	
	public String[] setData(String[] str) { //배열로 데이터를 받았을때 빈칸이 넘어오는 값은 default가 ""다
		String[] arr = new String[str.length];
		for(int i=0; i<str.length; i++) {
			if(str[i].equals("")) {
				arr[i] = "";
			}else {
				arr[i] = str[i];
			}
		}
		
		return arr;
	}
	
	public String[] setIntData(String[] str) {
		String[] arr = new String[str.length];
		for(int i=0; i<str.length; i++) {
			if(str[i].equals("")) {
				arr[i] = "0";
			}else {
				arr[i] = str[i];
			}
		}
		
		return arr;
	}

}
