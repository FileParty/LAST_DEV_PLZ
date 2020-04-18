package com.petmily.user.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;


@WebServlet("/smtpEmail")
public class UserSMTPemailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserSMTPemailServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		[슬기 작업]
//		아이디 찾기 smtp 설정
//		유저가 입력한 이메일을 받아, DB값이 있는지 확인한다.
		String email = request.getParameter("email");
		
//		DB에 있는지 먼저 확인한다.
		User u = new UserService().searchUserEmail(email);
		System.out.println("유저의 값을 잘 가져왔는가? : "+u); // 값 잘 가져옴. 확인 완료!
		
		
		// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		if( u==null || !u.getEmail().equals(email)) { 
			request.setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다"); 
			request.setAttribute("loc", "/log-in"); // 로그인 화면으로 이동
			return;
		}
		else {
//			[SMTP 작업 : 참고자료 https://loy124.tistory.com/182]
//			자바메일 설정
			String host = "smtp.naver.com"; // smtp 메일 설정
			String user = "marungs@naver.com"; // 자신의 계정
			String password = "heartful12"; // 자신의 패스워드
			
//			메일받을 주소
			String to_email = "marungs@naver.com"; // 받는 이메일
			
			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");
			
			// 인증 번호 생성기
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String AuthenticationKey = temp.toString();
			System.out.println("SMTP(AuthenticationKey):"+AuthenticationKey);
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			
			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "PET:MILY"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("안녕하세요. [펫밀리] 아이디 찾기 인증 메일입니다.");
				// 메일 내용
				msg.setText("인증 번호 :" + temp);

				Transport.send(msg);
				System.out.println("이메일 전송");

			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			
//			인증번호가 맞는지 로직을 구현하기 위해 값을 가져갈거얌
			HttpSession saveKey = request.getSession();
			saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
			HttpSession session2 = request.getSession();
			session2.setAttribute("AuthenticationKey", AuthenticationKey);
			
			// 패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id ( 내 로직엔 필요 없어 보여서 주석처리 완료)
			/*
			 * req.setAttribute("id", memberId);
			 * req.getRequestDispatcher("/views/login_myPage/searchPasswordEnd.jsp").forward
			 * (req, resp);
			 */

			request.setAttribute("email", email);
			request.getRequestDispatcher("/views/user/userIdFindRandomNum.jsp").forward(request, response);
		} // else
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
