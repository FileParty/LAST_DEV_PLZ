package com.petmily.petsitterMyPage.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.petsitterMyPage.reservation.service.PetsitterMypageReservationService;

/**
 * Servlet implementation class ReservationUpdateStatusRefusalServlet
 */
@WebServlet("/petsitter/mypage/statusRefusal")
public class ReservationUpdateStatusRefusalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationUpdateStatusRefusalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] reservationArray = request.getParameterValues("reservationCode");
		int[] pcodes=new int[reservationArray.length];
		for(int i=0; i<reservationArray.length; i++) {
			
			String re = reservationArray[i];
			
			// int형으로 변환 해서 다시 pcodes 에 대입
			pcodes[i]=Integer.parseInt(re);
		}
		
		
		//int pcode = Integer.parseInt((String)request.getParameterValues("reservationCode"));
		
		int result=new PetsitterMypageReservationService().updateStatusRefusal(pcodes);
		
		//for(String pcode : pcodes) {
		//	System.out.println("pcode"+pcode);
		//}
	    System.out.println(result);
	    
		request.getRequestDispatcher("/petsitter/mypage/beforePaymentReservation").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
