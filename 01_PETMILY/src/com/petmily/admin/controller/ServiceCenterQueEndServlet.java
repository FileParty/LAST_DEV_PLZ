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
 * Servlet implementation class ServiceCenterQueServlet
 */
@WebServlet("/scQuestionEnd")
public class ServiceCenterQueEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceCenterQueEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		AdminQuestion aq = new AdminQuestion();
		aq.setUserId(request.getParameter("userId"));
		aq.setSendEmail(request.getParameter("email"));
		aq.setEmailTitle(request.getParameter("aData"));
		
		int result = new AdminService().scQue(aq);
		
		if(result>0) {
			request.setAttribute("msg", "문의하기에 성공했습니다.");
			request.setAttribute("script", "window.close(); opener.document.location.reload();");
			request.setAttribute("loc", "/serivceCenter");
		} else {
			request.setAttribute("msg", "문의하기에 실패했습니다.");
			request.setAttribute("script", "window.close()");
			request.setAttribute("loc", "/serivceCenter");
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
