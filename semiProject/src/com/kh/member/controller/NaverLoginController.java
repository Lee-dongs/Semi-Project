package com.kh.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class NaverLoginController
 */
@WebServlet("/naverLogin.me")
public class NaverLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String clientId = "aIxQUJI0DPZGmIDYZ94e";
		String clientSecret = "qlRw7gpILK"; 
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8888/semiProject/","UTF-8");
				
		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&"
				+ "client_id=" + clientId
				+ "&client_secret=" + clientSecret
				+ "&redirect_uri=" + redirectURI
				+ "&code=" + code
				+ "&state=" + state;
		String access_token = "";
		String refresh_token = "";
				
		try { 
			  URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      
		      int responseCode = con.getResponseCode();
		      
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      
		      if(responseCode==200) { // 정상 호출
		    	  
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		        
		      } else {  // 에러 발생
		    	  
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		        
		      }
		      
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      
		      while ((inputLine = br.readLine()) != null) {
		    	  
		        res.append(inputLine);
		        
		      }
		      
		      br.close();
		      
		      if(responseCode==200) { // 정상작동시 토큰발급
		    	  
		        System.out.println(res.toString());
		    	JSONParser parsing = new JSONParser();
		    	Object obj = parsing.parse(res.toString());
		    	JSONObject jsonObj = (JSONObject)obj;
		    		        
		    	access_token = (String)jsonObj.get("access_token");
		    	refresh_token = (String)jsonObj.get("refresh_token");
		    	
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		
		if(access_token != null) { // access_token을 잘 받아왔다면

			try {

				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", "Bearer " + access_token);
				
				int responseCode = con.getResponseCode();
				BufferedReader br;

				if(responseCode==200) { // 정상 호출
				  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
				  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}

				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
				  res.append(inputLine);
				}

				br.close();
				
				
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
				JSONObject resObj = (JSONObject)jsonObj.get("response");
				 
				//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
				//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
				String naverCode = (String)resObj.get("id");
				String email = (String)resObj.get("email");
				String name = (String)resObj.get("name");
				String nickName = (String)resObj.get("nickname");
				
				Member loginUser = new Member();
				loginUser.setUserId(naverCode);
				loginUser.setEmail(email);
				loginUser.setUserName(name);
				System.out.println(loginUser);
				request.setAttribute("loginUser", loginUser);

		    } catch (Exception e) {
		    	System.out.println(e);
		    }

		}
		
		response.sendRedirect(request.getHeader("Referer"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
