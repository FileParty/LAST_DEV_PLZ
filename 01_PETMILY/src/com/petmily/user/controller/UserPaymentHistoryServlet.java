package com.petmily.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.UserPaymentHistory;


@WebServlet("/user/paymentHistory")
public class UserPaymentHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserPaymentHistoryServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		[슬기 작업]
//		일반사용자 마이페이지 - 결제내역 화면으로 전환하는 기능
		String id = request.getParameter("userId"); // 쿼리스트링문으로 가져온 현재 로그인한 사용자 값
		System.out.println("결제내역 화면으로 이동하기 위해 확인하는 id 값 : "+id);
		
//		결제내역 테이블 가져오기
//		DB에서 id와 동일한 정보를 가져온다
//		아이디가 현재 로그인된 아이디인 계정의 결제내역 내용을 가져온다.
		List<UserPaymentHistory> list = new UserService().userPaymentHistory(id); // 아이디만 보냄.
		System.out.println("결제내역 리스트를 받기 위해 먼저 뿌려져야 하는 회원정보. dao에서 값을 잘 가져왔는가? : "+list);
		
//		가져온값을 담는다.
		request.setAttribute("list", list);
//		응답페이지로 보낸다!
		request.getRequestDispatcher("/views/user/userPaymentHistory.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
