package com.petmily.petsitterMyPage.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation;
import com.petmily.petsitterMyPage.reservation.service.PetsitterMypageReservationService;
import com.petmily.petsitterReview.model.vo.PetSitterReview;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class PMAPSecretServlet
 */
@WebServlet("/sitter/secret")
public class PMAPSecretServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PMAPSecretServlet() {
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
	    System.out.println("코드 번호"+rsCode);
	    
	    PetSitterReview psr1 = new PetsitterMypageReservationService().selectSecret(rsCode);
	    System.out.println(psr1);
	    if(psr1==null) {
	    	rsCode = Integer.parseInt(request.getParameter("rsCode"));
	    	PetsitterMypageReservation pmr = new PetsitterMypageReservationService().afterPaymentSecret(sitterId, rsCode);
		    request.setAttribute("pmr", pmr);
		    request.getRequestDispatcher("/views/petsitterMypage/afterPaymentSecret.jsp").forward(request, response);
	    }else {
	    	
			String msg = "";
			
			msg = "이미 등록한 후기 입니다.";
			
			
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
