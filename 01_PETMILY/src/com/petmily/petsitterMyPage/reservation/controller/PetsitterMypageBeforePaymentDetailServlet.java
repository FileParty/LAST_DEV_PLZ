package com.petmily.petsitterMyPage.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageDetail;
import com.petmily.petsitterMyPage.reservation.service.PetsitterMypageReservationService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class PetsitterMypageBeforePaymentDetailServlet
 */
@WebServlet("/sitter/beforePaymentDetail")
public class PetsitterMypageBeforePaymentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterMypageBeforePaymentDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
	    String sitterId = ((User)session.getAttribute("loginUser")).getUserId();
	    
		int rsCode = Integer.parseInt(request.getParameter("rsCode"));
		
		List<PetsitterMypageDetail> list = new PetsitterMypageReservationService().selectBeforePaymentDetail(rsCode);
		System.out.println("가져오는 값"+list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/petsitterMypage/beforePaymentReservationDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
