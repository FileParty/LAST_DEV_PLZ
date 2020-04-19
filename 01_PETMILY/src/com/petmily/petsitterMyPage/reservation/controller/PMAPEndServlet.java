package com.petmily.petsitterMyPage.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.petsitterMyPage.reservation.service.PetsitterMypageReservationService;

/**
 * Servlet implementation class PMAPEndServlet
 */
@WebServlet("/sitter/end")
public class PMAPEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PMAPEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String[] reservationArray = request.getParameterValues("reservationCode");
		int[] pcodes=new int[reservationArray.length];
		for(int i=0; i<reservationArray.length; i++) {
			
			String re = reservationArray[i];
			
			// int형으로 변환 해서 다시 pcodes 에 대입
			pcodes[i]=Integer.parseInt(re);
		}
		
		int result=new PetsitterMypageReservationService().end(pcodes);
		
		if(result>0) {
			System.out.println(result);   
			request.getRequestDispatcher("/sitter/afterPaymentReservation").forward(request, response);
		}else {
			String msg = "";
			
			msg = "실패하였습니다.";
			
			
			request.setAttribute("msg", msg);
			
			

			request.getRequestDispatcher("/views/common/pop.jsp")
			.forward(request,response);
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
