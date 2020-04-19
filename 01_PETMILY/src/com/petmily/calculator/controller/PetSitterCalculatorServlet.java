package com.petmily.calculator.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.calculator.model.vo.Calculator;
import com.petmily.calculator.service.CalculatorService;
import com.petmily.user.model.vo.User;



/**
 * Servlet implementation class PetSitterCalculatorServlet
 */
@WebServlet("/sitter/calculator")
public class PetSitterCalculatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetSitterCalculatorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
	    String userId = ((User)session.getAttribute("loginUser")).getUserId();
		List<Calculator> list=new CalculatorService().selectCalculator(userId);
		System.out.println("로그인"+userId);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/sitter/sitterCalculator.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
