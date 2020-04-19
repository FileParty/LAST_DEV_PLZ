package com.petmily.sitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class SitterUpdateServlet
 */
@WebServlet("/sitter/Update")
public class SitterUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//����ȸ������ �������� �̵�
//		ȸ������ �����ϴ� ȭ������ ��ȯ
//		�α��� �� ������ ����� �� �ֵ��� ������ �ɾ�� �Ѵ�.
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null) { // �α��� �������� set ó�� �Ϸ�
//			�߸��� ���� ó��
			request.setAttribute("msg","�߸��� �����Դϴ�.");
			request.setAttribute("loc", "/"); // �������� �̵�
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
			String id = request.getParameter("userId");
			System.out.println("ȸ���������� ȭ������ �̵��ϱ� ���� Ȯ���ϴ� id �� : "+id);
			
//			�ϸ�ũ ���̺� ��������
//			DB���� id�� ������ ������ �����´�
//			���̵� ���� �α��ε� ���̵��� ������ �ϸ�ũ�� ������ �����´�.
			User u = new UserService().userSelect(id);
			System.out.println("���������ϱ� ���� ���� �ѷ����� �ϴ� ȸ������. dao���� user���� �� �����Դ°�? : "+u);
			
//			������ ������ �����ϰ� ���̵𰪰� �Բ� ���ΰ��� ������.
			request.setAttribute("user", u);
			request.getRequestDispatcher("/views/petsitterMypage/sitterUpdateInfo.jsp").forward(request, response);
			
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
