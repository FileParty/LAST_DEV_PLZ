package com.petmily.petsitter.certificate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class PetsitterAddCertificateServlet
 */
@WebServlet("/petsitter/AddCertificate")
public class PetsitterAddCertificateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterAddCertificateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/upload/board");
		int maxSize = 1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		
		
		String id = mr.getParameter("id");
		String certificateName = mr.getParameter("certificateName");
		String certificationName = mr.getParameter("certificationName");
		String date = mr.getParameter("date");
		String date1 = mr.getParameter("date1");
		String radio = mr.getParameter("radio");
		String file = mr.getFilesystemName("file");
		System.out.println(id);
		System.out.println(certificateName);
		System.out.println(certificationName);
		System.out.println(date);
		System.out.println(date1);
		System.out.println(radio);
		System.out.println(file);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
