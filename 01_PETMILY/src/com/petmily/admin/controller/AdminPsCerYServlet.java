package com.petmily.admin.controller;

import static com.petmily.common.PageBarTemplate.getPageBar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.admin.model.vo.AdminPetsitter;
import com.petmily.admin.service.AdminService;

/**
 * Servlet implementation class AdminPetsitterCerApplyServlet
 */
@WebServlet("/admin/petsitterCerYList")
public class AdminPsCerYServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPsCerYServlet() {
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
		String type = "DATE_OF_ACQUISITION";
		if(request.getParameter("type")!=null) {
			type = request.getParameter("type");
		}
		int numPerPage = 10;
		
		ArrayList<AdminPetsitter> list = new AdminService().psCerYList(cPage,numPerPage,type);
		System.out.println(type);
		int totalDate = new AdminService().psCerYCount();
		String url = request.getContextPath() + "/admin/petsitterCerApply?type="+type;
		String pageBar = getPageBar(url,totalDate,cPage,numPerPage);
		System.out.println(list);
		
		request.setAttribute("pageType", "6");
		request.setAttribute("type", type);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("psList", list);
		request.getRequestDispatcher("/views/admin/psCerY.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
