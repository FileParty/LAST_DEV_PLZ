package com.petmily.reservation.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.petsitter.certificate.service.SitterCertificateService;
import com.petmily.petsitter.model.vo.PetSitterCertificate;
import com.petmily.reservation.model.vo.PetReservation;
import com.petmily.reservation.service.ReservationService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class UserReservationRequestServlet
 */
@WebServlet("/user/request")
public class UserReservationRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    String userId = ((User)session.getAttribute("loginUser")).getUserId();
		String type = request.getParameter("type");
						
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage=5;		

		List<PetReservation> list= new ReservationService().requestRev(userId,cPage,numPerPage);
		int totalData = new ReservationService().requestCount(userId);
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='" + request.getContextPath() + "/user/request?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+ request.getContextPath() + "/user/request?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+ request.getContextPath() + "/user/request?cPage="+pageNo+"'>[다음]</a>";
		}
		
		
		
		
		
		
		int num[] = new int[list.size()];
		
		if(type!=null) { 
		switch(type) {
		case "btn" : 
						Collections.sort(list,(i,j)->j.getReservationCode()-i.getReservationCode());
						request.setAttribute("pageBar", pageBar);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/sort.jsp").forward(request, response);
						
						break;
		case "btn1" : 
						Collections.sort(list,(i,j)->i.getReservationCode()-j.getReservationCode());
						request.setAttribute("pageBar", pageBar);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/sort.jsp").forward(request, response);
						
							break;
		case "btn2" : 
						Collections.sort(list,(i,j)->i.getCheckIn().compareTo(j.getCheckIn()));
						request.setAttribute("pageBar", pageBar);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/sort.jsp").forward(request, response);
							break;
		case "btn3" : 
						Collections.sort(list,(i,j)->j.getCheckIn().compareTo(i.getCheckIn()));
						request.setAttribute("pageBar", pageBar);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/sort.jsp").forward(request, response);
						
						break;
		case "btn4" : 
						Collections.sort(list,(i,j)->j.getPrice()-i.getPrice());
						request.setAttribute("pageBar", pageBar);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/sort.jsp").forward(request, response);
						break;
		case "btn5" :
						Collections.sort(list,(i,j)->i.getPrice()-j.getPrice());
						request.setAttribute("pageBar", pageBar);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/sort.jsp").forward(request, response);
						
						break;
		}
		
		}else { 
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
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
