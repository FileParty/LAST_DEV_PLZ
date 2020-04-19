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
 * Servlet implementation class SitterDelete
 */
@WebServlet("/sitter/Delete")
public class SitterDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")==null) { // �α����� ���� ������(�α��� ����)
//			�߸��� ���� ó��
			request.setAttribute("msg","�߸��� �����Դϴ�.");
			request.setAttribute("loc", ""); // �������� �̵�
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else { // �α����� ���� ������(�α��� ��)
//			������ ��ȯ
			String id = request.getParameter("userId");
			System.out.println("ȸ��Ż���ϱ� ���� ������ id�� Ȯ�� : "+id);
			
//			DB���� id�� ������ ������ �����´�
			User u = new UserService().userSelect(id);
			System.out.println("ȸ��Ż���ϱ����� ��������. dao���� user���� �� �����Դ°�? : "+u);
			
//			������ ������ ����
			request.setAttribute("user", u);
			
//			ȸ��Ż�� ȭ������ ��ȯ
			request.getRequestDispatcher("/views/petsitterMypage/sitterDelete.jsp").forward(request, response);
			
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
