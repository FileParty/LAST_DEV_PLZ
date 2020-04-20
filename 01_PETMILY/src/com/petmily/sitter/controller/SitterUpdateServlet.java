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
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
