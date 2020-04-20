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
 * Servlet implementation class SitterDelete
 */
@WebServlet("/sitter/Delete")
public class SitterDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    String userId = ((User)session.getAttribute("loginUser")).getUserId();
	    
	    User u = new UserService().userSelect(userId);
	    request.setAttribute("user", u);
		request.getRequestDispatcher("/views/petsitterMypage/sitterDelete.jsp").forward(request, response);
		
		//		회원정보 - 회원탈퇴 화면으로 전환하는 기능
//		로그인 한 유저만 사용할 수 있도록 처리한다.
//		HttpSession session = request.getSession();
		/* String sitterId = ((User)session.getAttribute("loginUser")).getUserId(); */
		
//		User loginUser = (User)session.getAttribute("loginUser"); // 로그인한 유저의 계정(펫시터)
//		boolean flag = loginUser.getUserType().equals("펫시터");
		
		/*
		 * HttpSession session = request.getSession(); String sitterId =
		 * ((User)session.getAttribute("loginUser")).getUserId(); PetSitter2 pss = new
		 * UserService().sitterSelect(sitterId); request.setAttribute("petsitter2",
		 * pss);
		 * request.getRequestDispatcher("/views/petsitterMyPage/sitterDelete.jsp").
		 * forward(request, response);
		 */
		/*
		 * if(flag) {
		 * 
		 * String id = request.getParameter("userId");
		 * System.out.println("회원탈퇴하기 위해 가져온 id값 확인 : "+id);
		 * 
		 * // DB에서 id와 동일한 정보를 가져온다 User u = new UserService().userSelect(id);
		 * System.out.println("회원탈퇴하기위한 유저정보. dao에서 user값을 잘 가져왔는가? : "+u);
		 * 
		 * // 가져온 데이터 저장 request.setAttribute("user", u);
		 * 
		 * // 회원탈퇴 화면으로 전환
		 * request.getRequestDispatcher("/views/petsitterMyPage/sitterDelete.jsp").
		 * forward(request, response);
		 * 
		 * } else { // 페이지 전환 request.setAttribute("msg","잘못된 접근입니다.");
		 * request.setAttribute("loc", ""); // 메인으로 이동
		 * request.getRequestDispatcher("/views/common/msg.jsp").forward(request,
		 * response); }
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
