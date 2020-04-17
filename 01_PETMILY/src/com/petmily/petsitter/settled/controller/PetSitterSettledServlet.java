package com.petmily.petsitter.settled.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sitter/settled")
public class PetSitterSettledServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PetSitterSettledServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		펫시터 마이페이지 - 이전 정산 보기 목록 
		request.getRequestDispatcher("/views/petsitterMypage/petSitterQuealifylist.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
