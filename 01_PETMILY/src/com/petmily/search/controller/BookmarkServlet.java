package com.petmily.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.petmily.search.service.SearchService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class BookmarkServlet
 */
@WebServlet("/search/bookmark")
public class BookmarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		User u=(User)session.getAttribute("loginUser");
		
		String userId=u.getUserId();
		
		String petsitterId=request.getParameter("petsitterId");
		int result=new SearchService().insertBookmark(userId,petsitterId); 
		
		boolean flag=new SearchService().findBookmark(userId,petsitterId);
		
		//new Gson().toJson(flag,response.getWriter());
		response.getWriter().write("<i class=\"fas fa-heart\"></i>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
