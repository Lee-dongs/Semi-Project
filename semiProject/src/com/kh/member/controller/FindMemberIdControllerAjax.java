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
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FindMemberIdController
 */
@WebServlet("/findUserId.me")
public class FindMemberIdControllerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMemberIdControllerAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 비동기 : 전달받은 이메일로 아이디 발송하기
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String result = ""; // 성공 실패 여부 보낼 매개변수
		// 이메일로 유저를 검색해서, 사용자가 입력한 이름과 일치한다면 이메일, 아니면 result에 'N'보내기
		
		ServletContext context = getServletContext();
        InputStream inputStream = context.getResourceAsStream("/WEB-INF/classes/sql/smtp/smtp.properties");
        // 네이버 이메일 전송 사용자 정보 담아둔 property파일
        Properties smtp = new Properties();
        smtp.load(inputStream);
		
		Member m = new MemberService().findUserId(userName, userEmail);
		
		if (m != null) { // 정보가 일치하는 회원이 있으면 메일 발송
			
			String host = smtp.getProperty("host");
			int port = Integer.parseInt(smtp.getProperty("port"));
			String from = smtp.getProperty("from"); // 보내는 사람
			String password = smtp.getProperty("password");
			
			String title = "5조에서 보내는 회원님의 아이디찾기 결과입니다.";
			String content = "[아이디]" + m.getUserId() + " 입니다.";

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

				result = "Y"; 

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = "N";
			}
		} else { // 정보 일치하는 회원이 없으면 매개변수로 "N"메세지 보내기
			result = "N"; 

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
