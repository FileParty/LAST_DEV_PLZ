package com.petmily.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.admin.model.vo.AdminQuestion;
import com.petmily.admin.service.AdminService;

/**
 * Servlet implementation class AdminQuestionPopUpServlet
 */
@WebServlet("/admin/quePopUp")
public class AdminQuestionPopUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionPopUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String scnum = request.getParameter("scNum");
		System.out.println(scnum);
		
		AdminQuestion u = new AdminService().questionData(scnum);
		System.out.println(u);
		request.setAttribute("question", u);
		request.getRequestDispatcher("/views/admin/adminQuestionEmail.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
