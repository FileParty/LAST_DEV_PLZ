package com.petmily.sitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;

/**
 * Servlet implementation class SitterUpdateServlet
 */
@WebServlet("/sitter/updateEnd")
public class SitterUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//최종 시터 회원 수정
		String img=request.getParameter("profileImg");
		String id = request.getParameter("userId"); // �븘�씠�뵒
		String email = request.getParameter("email"); // �씠硫붿씪
		String phone = request.getParameter("phone"); // �쑕��踰덊샇
		String postNum = request.getParameter("postNum"); // �슦�렪踰덊샇
		String address = request.getParameter("address"); //  �룄濡쒕챸 二쇱냼
		String detailAddress = request.getParameter("detail"); // �긽�꽭二쇱냼
		String bankName = request.getParameter("bankName");
		String accountNo=request.getParameter("accountNo");
		String accountName=request.getParameter("accountName");
		String pw = request.getParameter("nowpw"); // �쁽�옱 鍮꾨�踰덊샇
		String newPw = request.getParameter("newpw"); // �깉 鍮꾨�踰덊샇
		
		
		

		int result= new UserService().sitterUpdateEnd(id, newPw, email, phone, postNum, address, detailAddress, bankName,accountNo,accountName,img);
		

		String msg = "";
		String loc = "";
		

		if(result>0) {
			msg = "회원정보 수정에 성공하였습니다.";
			
			loc = "/common/Info?userId="+id; 
		}
		else {
			msg = "회원정보 수정이 실패하였습니다.";
			
			loc = "/sitter/Update?userId="+id; 
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
