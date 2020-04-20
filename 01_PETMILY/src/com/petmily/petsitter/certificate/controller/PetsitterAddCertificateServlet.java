package com.petmily.petsitter.certificate.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.petmily.petsitter.certificate.service.SitterCertificateService;
import com.petmily.petsitter.model.vo.PetSitterCertificate;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class PetsitterAddCertificateServlet
 */
@WebServlet("/sitter/AddCertificate")
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
		
		
		 HttpSession session = request.getSession();
	     String userId = ((User)session.getAttribute("loginUser")).getUserId();
	    
	     
	     int cPage;
			try {
				cPage=Integer.parseInt(request.getParameter("cPage"));
			}catch(NumberFormatException e) {
				cPage=1;
			}
			
			int numPerPage=5;		

			List<PetSitterCertificate> list = new  SitterCertificateService().selectCertificate2(userId,cPage,numPerPage);
			int totalData = new SitterCertificateService().certificateCount2(userId);
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
			
			String pageBar="";
			int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			
			if(pageNo==1) {
				pageBar+="<span>[이전]</span>";
			}else {
				pageBar+="<a href='" + request.getContextPath() + "/sitter/AddCertificate?cPage="+(pageNo-1)+"'>[이전]</a>";
			}
			
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(pageNo==cPage) {
					pageBar+="<span>"+pageNo+"</span>";
				}else {
					pageBar+="<a href='"+ request.getContextPath() + "/sitter/AddCertificate?cPage="+pageNo+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<span>[다음]</span>";
			}else {
				pageBar+="<a href='"+ request.getContextPath() + "/sitter/AddCertificate?cPage="+pageNo+"'>[다음]</a>";
			}
	     
		request.setAttribute("pc", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/userReservation/addCertificate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
