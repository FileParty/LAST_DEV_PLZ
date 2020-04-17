package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;


@WebServlet("/common/Info")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserInfoServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		�궗�슜�옄 留덉씠�럹�씠吏� �솕硫댁쓣 �쟾�솚�븯�뒗 湲곕뒫
//		濡쒓렇�씤 �븳 �쑀��留� �궗�슜�븷 �닔 �엳�룄濡� 泥섎━�븳�떎.
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")==null) {
			request.setAttribute("msg","로그인이 필요한 서비스입니다.");
			request.setAttribute("loc", "");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
			String id = request.getParameter("userId");
			
			User u = new UserService().userSelect(id);
			
			request.setAttribute("user", u);
			switch(u.getUserType()) {
				case "일반" : request.getRequestDispatcher("/views/user/userInfo.jsp").forward(request, response); break;
				case "펫시터" : request.getRequestDispatcher("/views/petsitterMypage/petSitterInfo.jsp").forward(request, response); break;
				case "관리자" : request.getRequestDispatcher("/views/admin/adminMypage.jsp").forward(request, response); break;
			}
			
		}
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
