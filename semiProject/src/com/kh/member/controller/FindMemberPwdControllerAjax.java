package com.kh.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;


/**
 * Servlet implementation class FindMemberPwdControllerAjax
 */
@WebServlet("/findUserPwd.me")
public class FindMemberPwdControllerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMemberPwdControllerAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 비동기 : 전달받은 이메일로 임시 비밀번호 발송하기
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail"); // 입력한 사용자 이메일주소
		
		String newPwd = ""; //새로 만들 비밀번호
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
				'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};
		// 문자배열에서 10개를 랜덤으로 뽑아서 문자열 만들기
		int index = 0;
		for (int i = 0; i < 10; i++) {
			index = (int) (charSet.length * Math.random());
			newPwd += charSet[index];
		}
		
		ServletContext context = getServletContext();
        InputStream inputStream = context.getResourceAsStream("/WEB-INF/classes/sql/smtp/smtp.properties");
        // 네이버 이메일 전송 사용자 정보 담아둔 property파일
        Properties smtp = new Properties();
        smtp.load(inputStream);
        
        // 입력한 정보 일치하는 회원 있는지 확인
        int count = new MemberService().findUserPwd(userId, userEmail);
        
        // 전송할 메세지 
        String result = "";
        
        if(count > 0) { // 일치하는 회원이 있으면
        	
        	// 비밀번호 업데이트
        	new MemberService().updatePwd(userId, newPwd);
        	
        	// 메일로 새로운 비밀번호 보내기
        	String host = smtp.getProperty("host");
        	int port = Integer.parseInt(smtp.getProperty("port"));
        	String from = smtp.getProperty("from"); // 보내는 사람
        	String password = smtp.getProperty("password");
        	
        	String title = "5조에서 보내는 임시 비밀번호입니다.";
        	String content = "[임시 비밀번호]" + newPwd + " 입니다. 반드시 해당 비밀번호로 로그인 후 마이페이지에서 새로운 비밀번호를 만들어주세요.";
        	
        	Properties prop = new Properties();
        	prop.put("mail.smtp.host", host);
        	prop.put("mail.smtp.port", port);
        	prop.put("mail.smtp.auth", "true");
        	prop.put("mail.smtp.ssl.enable", "true");
        	prop.put("mail.smtp.ssl.trust", host);
        	
        	Authenticator auth = new SMTPAuthenticator(smtp.getProperty("id"), password); // 내 아이디랑 비밀번호
        	Session session = Session.getDefaultInstance(prop, auth);
        	MimeMessage message = new MimeMessage(session);
        	
        	
        	try {
        		message.setFrom(new InternetAddress(from));
        		message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail)); // 이메일 받는 사람
        		message.setSubject(title, "UTF-8"); // 메일 제목
        		message.setText(content, "UTF-8"); // 메일 내용
        		message.setSentDate(new Date()); // 메일 보낸 시간
        		
        		Transport.send(message); // 이메일 보내기
        		
        		result = newPwd; // 성공하면 매개변수로 내가 만든 인증번호 보내기
        		
        	} catch (Exception e) {
        		// TODO Auto-generated catch block
        		e.printStackTrace();
        		result = "error"; // 실패시 매개변수로 "error"메세지 보내기
        	}
        }
		

		response.getWriter().print(result); // 비동기방식이므로 getWriter()를 이용해 매개변수 보내기

	}

	private static class SMTPAuthenticator extends Authenticator {
		// javax.mail.Authenticator 클래스가 추상 클래스이기 때문에 직접 객체를 생성할 수는 없고
		// 이 클래스를 상속한 자식 클래스를 만들어서 객체를 생성해야 함.
		private String username;
		private String password;

		public SMTPAuthenticator(String username, String password) {
			this.username = username;
			this.password = password;
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
