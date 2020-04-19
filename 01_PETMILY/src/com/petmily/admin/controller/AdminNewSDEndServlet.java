package com.petmily.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.admin.service.AdminService;

/**
 * Servlet implementation class AdminNewSDEndServlet
 */
@WebServlet("/admin/newSDEnd")
public class AdminNewSDEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewSDEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("scType");
		String scQ = request.getParameter("qData");
		String scA = request.getParameter("aData");
		
		int result = new AdminService().scInsert(type, scQ, scA);
		
		if(result>0) {
			request.setAttribute("msg", "새로운 QnA작성에 성공했습니다.");
			request.setAttribute("loc","/admin/scMain");
		} else {
			request.setAttribute("msg", "새로운 QnA작성에 실패했습니다!");
			request.setAttribute("loc","/admin/newSD");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
