package com.petmily.petsitterMyPage.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageUserReview;
import com.petmily.petsitterMyPage.reservation.service.PetsitterMypageReservationService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class UserReviewListServlet
 */
@WebServlet("/petsitter/mypage/userReviewList")
public class UserReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//HttpSession session = request.getSession();
		//User u=(User)session.getAttribute("loginUser");
		
		String userId=request.getParameter("userId");
		
		
		List<PetsitterMypageUserReview> list=new PetsitterMypageReservationService().selectPetsitterMypageUserReview(userId);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/petsitterMypage/secretReviewList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
