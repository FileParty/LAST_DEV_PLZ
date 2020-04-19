package com.petmily.admin.controller;

import static com.petmily.common.PageBarTemplate.getPageBar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.admin.model.vo.AdminQuestion;
import com.petmily.admin.service.AdminService;

/**
 * Servlet implementation class AdminSCNewSdServlet
 */
@WebServlet("/admin/newSD")
public class AdminSCNewSdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSCNewSdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage = 1;
		if(request.getParameter("cPage")!=null) {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		int numPerPage = 5;
		
		ArrayList<AdminQuestion> list = new AdminService().scAQlist(cPage, numPerPage);
		
		int totalDate = new AdminService().scCount();
		String url = request.getContextPath() + "/admin/scMain?type=엄준식";
		String pageBar = getPageBar(url,totalDate,cPage,numPerPage);
		
		request.setAttribute("pageType", "8");
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("aqList", list);
		request.getRequestDispatcher("/views/admin/adminSCNewSD.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
