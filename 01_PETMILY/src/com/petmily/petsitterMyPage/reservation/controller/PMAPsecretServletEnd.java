package com.petmily.petsitterMyPage.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.petsitterMyPage.reservation.service.PetsitterMypageReservationService;
import com.petmily.petsitterReview.model.vo.PetSitterReview;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class PMAPsecretServletEnd
 */
@WebServlet("/sitter/secretEnd")
public class PMAPsecretServletEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PMAPsecretServletEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
	    String sitterId = ((User)session.getAttribute("loginUser")).getUserId();
	    
		int rsCode = 0;
		System.out.println("코드번호2"+rsCode);
		String userId = request.getParameter("userId");
		int star = Integer.parseInt(request.getParameter("star"));
//		int sitterRNo = Integer.parseInt(request.getParameter("sitterRNo"));
		String reviewTxt = request.getParameter("reviewTxt");
		String reviewDate="";
		PetSitterReview psr = new PetSitterReview();
		
		try {
			rsCode = Integer.parseInt(request.getParameter("rsCode"));
		}catch(NumberFormatException e) {
			rsCode=-1;
		}
		psr.setReviewDate(reviewDate);
		psr.setReviewStar(star);
		psr.setReviewTxt(reviewTxt);
		psr.setRsCode(rsCode);
		psr.setSitterId(sitterId);
//		psr.setSitterReviewNo(sitterRNo);
		psr.setUserId(userId);
		
		int result = new PetsitterMypageReservationService().insertSecret(psr);
		System.out.println(result);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "후기 등록 성공";
		
		}else {
			msg = "후기 등록 실패";
			
		}
		
		request.setAttribute("msg", msg);
		
		request.getRequestDispatcher("/views/common/pop.jsp")
		.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
