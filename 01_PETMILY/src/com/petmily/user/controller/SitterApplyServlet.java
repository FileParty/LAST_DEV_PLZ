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
		
		//������ 諛��� �곗�댄�곕�� �몄���� 遺��ъ���� 媛��몄��
		HttpSession session=request.getSession();
		PetSitter2 pss=(PetSitter2)session.getAttribute("petsitter");
		
		System.out.println(pss);
		
		//�レ���� 吏��� �쇱���� 諛��� �곗�댄�곕�� ������ 媛��� 8媛�
		
		//�レ���� 吏����� ���� �대�
//		String sitterName=request.getParameter("name");
		//�レ���� 吏����� ���� �대���
//		String sitterEmail=request.getParameter("email");
		//�レ���� 吏����� ���� 二쇱��
//		String sitterAddress=request.getParameter("address");
		
		//�レ���� 吏����� ���� 嫄곗＜吏� ����
		String[] residenceValue=request.getParameterValues("houseType");
		//�レ���� 吏����� ���� 吏���
		String[] petSitterJob=request.getParameterValues("jobCheck");
		//�レ���� 吏����� 媛�議� 援ъ�깆�� 
		String petSitterFamily=request.getParameter("familyNoChck");
		//�レ���� 吏����� 諛��ㅻ��臾� 諛��� 寃쏀�� �щ�
		String petSitterKeeppets=request.getParameter("careCheck");
		//�レ���� 吏����� �レ���� 寃쎈�ν���� ��臾�
		String petSitterActivity=request.getParameter("career");
		
		//遺��ъ�� �곗�댄�곕�� vo�� �댁��以�
//		pss.setSitterName(sitterName);
//		pss.setSitterEmail(sitterEmail);
//		pss.setSitterAddress(sitterAddress);
		pss.setResidenceValue(String.join(",", residenceValue));
		pss.setPetSitterJob(String.join(",",petSitterJob));
		pss.setPetSitterFamily(petSitterFamily);
		pss.setPetSitterKeeppets(petSitterKeeppets); 
		pss.setPetSitterActivity(petSitterActivity);
		
		System.out.println(pss);
		
		//db�곌껐
		int result=new UserService().insertSitter(pss);
		
		//吏�����猷� ���댁�濡� ���닿�
		RequestDispatcher rd=request.getRequestDispatcher("/views/sitter/applyEnd.jsp");
		rd.forward(request, response);
		
		//�몄�� ���댁＜湲�
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
