package com.petmily.sitter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.PetSitter2;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class SitterUpdateServlet
 */
@WebServlet("/sitter/Update")
public class SitterUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
	    
		String userId = "";
		
	    if(null!=session.getAttribute("loginUser")) {
	    	//User u=(User)session.getAttribute("loginUser");
	    	//userId=u.getUserId();
	    	userId=request.getParameter("userId");
	    }else {
	    	userId="";
	    }
		
	    System.out.println(userId);
	    
	    PetSitter2 ps = new UserService().sitterSelect(userId);
	    request.setAttribute("ps", ps);
		request.getRequestDispatcher("/views/petsitterMypage/sitterUpdateInfo.jsp").forward(request, response);
		
		System.out.println("ps 확인"+ps);
		
		/*
		 * HttpSession session = request.getSession(); User loginUser =
		 * (User)session.getAttribute("loginUser"); // 로그인한 유저의 계정(펫시터) boolean flag =
		 * loginUser.getUserType().equals("펫시터");
		 */
		
	    /*String sitterId = ((User)session.getAttribute("loginUser")).getUserId();*/
	    
//		if(flag) { 
//			String id = loginUser.getUserId();
////			
//			User u = new UserService().userSelect(id);
//			request.setAttribute("user", u);
//			request.getRequestDispatcher("/views/petsitterMypage/sitterUpdateInfo.jsp").forward(request, response);
//		}
//		else {
////			사용자 타입이 '펫시터'인 유저가 아니라면, 해당 로직을 구현하라.
//			request.setAttribute("msg","잘못된 접근입니다.");
//			request.setAttribute("loc", "/"); // 메인으로 이동
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			System.out.println("현재 사용자 타입이 '펫시터'가 아닙니다. -> "+loginUser.getUserType());
////			뭘 더 구현해야 하나..?
//		}
//		else {
//			String id = request.getParameter("userId");
//			
//			User u = new UserService().userSelect(id);
//			
//			request.setAttribute("user", u);
//			request.getRequestDispatcher("/views/petsitterMypage/sitterUpdateInfo.jsp").forward(request, response);
//			
//		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
