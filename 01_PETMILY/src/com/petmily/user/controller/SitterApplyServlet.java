package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.PetSitter2;

/**
 * Servlet implementation class SitterApplyServlet
 */
@WebServlet("/apply/form")
public class SitterApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		PetSitter2 pss=(PetSitter2)session.getAttribute("petsitter");
		
		System.out.println(pss);
		
		
//		String sitterName=request.getParameter("name");
		
//		String sitterEmail=request.getParameter("email");
		
//		String sitterAddress=request.getParameter("address");
		
		
		String[] residenceValue=request.getParameterValues("houseType");
		
		String[] petSitterJob=request.getParameterValues("jobCheck");
		
		String petSitterFamily=request.getParameter("familyNoChck");
		
		String petSitterKeeppets=request.getParameter("careCheck");
		
		String petSitterActivity=request.getParameter("career");
		
//		pss.setSitterName(sitterName);
//		pss.setSitterEmail(sitterEmail);
//		pss.setSitterAddress(sitterAddress);
		pss.setResidenceValue(String.join(",", residenceValue));
		pss.setPetSitterJob(String.join(",",petSitterJob));
		pss.setPetSitterFamily(petSitterFamily);
		pss.setPetSitterKeeppets(petSitterKeeppets); 
		pss.setPetSitterActivity(petSitterActivity);
		
		System.out.println(pss);
		
		
		int result=new UserService().insertSitter(pss);
		
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/sitter/applyEnd.jsp");
		rd.forward(request, response);
		
		
		session.removeAttribute("petsitter");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
