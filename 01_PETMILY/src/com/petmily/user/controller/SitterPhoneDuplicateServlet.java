package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;


@WebServlet("/phoneDuplicate")
public class SitterPhoneDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SitterPhoneDuplicateServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String phone = request.getParameter("phone"); 
		System.out.println("sitterPhone: "+phone);
		
		boolean flag = new UserService().sitterPhoneDuplicate(phone);
		

		request.setAttribute("flag", flag);
		

		request.getRequestDispatcher("/views/sitter/sitterjoinDuplicatePhone.jsp").forward(request, response); 
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
