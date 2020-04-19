package com.petmily.admin.controller;

import java.io.IOException;

import javax.mail.Message;
import javax.mail.MessagingException;
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

import com.petmily.admin.service.AdminService;

/**
 * Servlet implementation class AdminEmailServlet
 */
@WebServlet("/admin/questionEmail")
public class AdminQuestionEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		String qdata = request.getParameter("qData");
		String adata = request.getParameter("aData");
		String scNum = request.getParameter("scNum");
		
		String host = "smtp.naver.com";
		String user = "wadsij@naver.com";
		String password = "kim1q2w3e4r";
		
		int result = 0;
		
		// SMTP서버 정보 설정
		java.util.Properties props = new java.util.Properties(); 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password); } 
		});
		// 전송할 페이지 작성
		String content = "<div>";
		content += "<p style='font-size:20px'>안녕하십니까 고객님, 펫밀리의 답변내용입니다.</p>";
		content += "<pre>질문 : "+ qdata  + "</pre>";
		content += "<hr/>";
		content += "<pre>답변 : " + adata + "</pre>";
		content += "</div>";
		try { 
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user)); 
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 메일 제목 
			msg.setSubject("PETMILY 문의사항 답변내용입니다.");
			// 메일 전송 및 html로 셋팅
			msg.setContent(content, "text/html; charset=UTF-8");
			// send the message 
			Transport.send(msg);
			
			result = new AdminService().questionUpdate(adata,scNum);
			
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		if(result>0) {
			request.setAttribute("msg", "메일 회신에 성공했습니다.");
			request.setAttribute("script", "window.close(); opener.document.location.reload();");
			request.setAttribute("loc", "/admin/apply");
		} else {
			request.setAttribute("msg", "메일 회신에 실패했습니다.");
			request.setAttribute("script", "window.close()");
			request.setAttribute("loc", "/admin/apply");
		}
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
