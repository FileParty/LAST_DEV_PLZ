package com.petmily.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.reservation.model.vo.PetReservation;
import com.petmily.reservation.service.ReservationService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class UserReservationingServlet
 */
@WebServlet("/user/reservationing")
public class UserReservationingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
	     String userId = ((User)session.getAttribute("loginUser")).getUserId();
	     List<PetReservation> list = new ReservationService().reservation(userId);
	     System.out.println("서블릿 -----"+list.size());
	     for(int i=0;i<list.size();i++) {
	     System.out.println("서블릿 -----"+list.get(i));
	     
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/userReservation/userReservationing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
