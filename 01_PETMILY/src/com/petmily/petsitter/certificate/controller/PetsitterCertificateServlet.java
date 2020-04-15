package com.petmily.petsitter.certificate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.petsitter.certificate.service.SitterCertificateService;
import com.petmily.petsitter.model.vo.PetSitterCertificate;

/**
 * Servlet implementation class PetsitterCertificateServlet
 */
@WebServlet("/petsitter/certificate")
public class PetsitterCertificateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterCertificateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = "petsitter1";
		PetSitterCertificate pc = new  SitterCertificateService().selectCertificate(id);
		request.setAttribute("pc", pc);
		request.getRequestDispatcher("/views/userReservation/certificate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
