package com.petmily.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.reservation.service.ReservationService;

/**
 * Servlet implementation class UserRequestCancelServlet
 */
@WebServlet("/request/cancels")
public class UserRequestCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRequestCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] revNo = request.getParameterValues("choose");
		
		int as[] = new int[revNo.length] ;
		
		for(int i=0;i<revNo.length;i++) {
			as[i] = Integer.parseInt(revNo[i]);
		}
		int result = new ReservationService().requestCancel(as);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg="예약이 취소되었습니다.";
			loc="/user/request";
		}else {
			msg="다시 시도해주세요.";
			loc="/user/request";
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
