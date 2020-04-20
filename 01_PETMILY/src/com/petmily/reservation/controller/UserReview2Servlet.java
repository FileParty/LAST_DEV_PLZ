package com.petmily.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.reservation.service.ReservationService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class UserReview2Servlet
 */
@WebServlet("/user/reviews")
public class UserReview2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReview2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	     String userId = ((User)session.getAttribute("loginUser")).getUserId();
		int no = Integer.parseInt(request.getParameter("no"));
		String text = request.getParameter("text");
		int star = Integer.parseInt(request.getParameter("star"));
		String pId = request.getParameter("pId");
		
		int result = new ReservationService().reviewInsert(no,text,star,pId,userId);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="후기가 등록되었습니다.";
			loc="/views/user/userInfo.jsp";
		}else {
			msg="후기 등록이 실패 하였습니다.";
			loc="/user/review1";
		}
		String close = "window.close()";
		request.setAttribute("msg", msg);
		request.setAttribute("close", close);
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
