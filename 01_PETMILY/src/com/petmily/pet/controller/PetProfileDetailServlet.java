package com.petmily.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.pet.model.vo.Pet;
import com.petmily.pet.service.PetService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class PetProfileDetailServlet
 */
@WebServlet("/user/petprofile/detail")
public class PetProfileDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetProfileDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int no = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
	    String id = ((User)session.getAttribute("loginUser")).getUserId();
		
		
		Pet p = new PetService().petProfileDetail(id,no);
		request.setAttribute("p", p);
		request.getRequestDispatcher("/views/user/petProfileDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
