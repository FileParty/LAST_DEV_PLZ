package com.petmily.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class SitterJoinEndServlet
 */
@WebServlet("/join/before")
public class BeforeSitterApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforeSitterApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//만약 로그인이 되어있다면 로그아웃 후 이용해주세요 메세지 후 메인페이지로 이동
		//로그인이 되어있지 않을 때에는 정상적으로 펫시터 회원가입 페이지로 이동
		HttpSession session=request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			request.setAttribute("msg", "로그아웃 후 이용해주세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/views/sitter/sitterJoin.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
