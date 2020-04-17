package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;



@WebServlet("/SitterIdDuplicate")
public class SitterIdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SitterIdDuplicateServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String sitterId = request.getParameter("sitterId"); 
		
		boolean flag = new UserService().sitterIdDuplicate(sitterId);
		

		request.setAttribute("flag", flag);
		

		request.getRequestDispatcher("/views/sitter/SitterjoinDuplicate.jsp?sitterId="+sitterId).forward(request, response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
