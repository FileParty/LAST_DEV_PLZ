package com.petmily.sitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;

/**
 * Servlet implementation class SitterDeleteEnd
 */
@WebServlet("/sitter/DeleteEnd")
public class SitterDeleteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterDeleteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ȸ������ �����ϴ� ����
		String id = request.getParameter("userId"); // ���� ���̵�
		
//		ȸ��Ż���ϱ� ���� service ����
		int result = new UserService().userDelete(id); // ����� int��
		
//		���������� ����
		String msg = "";
		String loc = "";
		
		if(result>0) {
//			ȸ��Ż�� �Ϸ�
			msg = "ȸ��Ż�� ó���� �Ϸ�Ǿ����ϴ�.";
//			�α׾ƿ� ó���� �Ǹ鼭 ����ȭ������ ��ȯ�Ѵ�
			loc = "/log-out"; // �α׾ƿ� ó���� �Ǿ�� �Ѵ�.  (�߿�)
		}
		else {
//			ȸ��Ż�� ����
			msg = "ȸ��Ż�� ó���� ���еǾ����ϴ�.";
//			ȸ��Ż�� ȭ������ ������
			loc = "/sitter/Delete?userId="+id; // �������̵�� �ݵ�� ���� ������
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
