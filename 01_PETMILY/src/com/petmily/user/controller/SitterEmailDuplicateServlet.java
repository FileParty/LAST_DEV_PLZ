package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;


@WebServlet("/emailDuplicate")
public class SitterEmailDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SitterEmailDuplicateServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email"); // input�� ���� �대��� ���대�� ���κ�怨� select���� 怨�瑜� �대��쇨� �⑹�寃�
		System.out.println("email:" +email);
		
		boolean flag = new UserService().sitterEmailDuplicate(email);
		

		request.setAttribute("flag", flag);
		

		request.getRequestDispatcher("/views/sitter/sitterjoinDuplicateEmail.jsp").forward(request, response); 
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
