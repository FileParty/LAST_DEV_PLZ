package com.petmily.sitter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;

/**
 * Servlet implementation class SitterUpdateServlet
 */
@WebServlet("/sitter/updateEnd")
public class SitterUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String img=request.getParameter("profileImg");
		String id = request.getParameter("userId"); // ����占썲����占쏙옙����占�
		String email = request.getParameter("email"); // ����占쏙옙嶺�占썽�븐�곤옙占�
		String phone = request.getParameter("phone"); // ����占쏙옙��������怨�占쏙옙占쏙옙
		String postNum = request.getParameter("postNum"); // ����占쏙옙����占썬��由곤옙占쏙옙占�
		String address = request.getParameter("address"); //  ����占썲�β�わ옙占쏙㎖占� ��占쏙옙源�占쏙옙
		String detailAddress = request.getParameter("detail"); // ����留���������占쏙옙源�占쏙옙
		String bankName = request.getParameter("bankName");
		String accountNo=request.getParameter("accountNo");
		String accountName=request.getParameter("accountName");
		String pw = request.getParameter("nowpw"); // ����占쎌����占쏙옙 占쏙옙熬��⑥����怨�占쏙옙占쏙옙
		String newPw = request.getParameter("newpw"); // ����占� 占쏙옙熬��⑥����怨�占쏙옙占쏙옙
		
		
		
//		����占쏙옙�곤옙��占� ����占쏙옙����占쏙옙����由��ル���� ����占쏙옙����占� service�β�쎌�� ����占쎈����占쏙옙�����뀐옙占썲��占� �곤옙占쏙옙亦�占썲����占쏙옙(����占썲����占쏙옙����占�, ����占� 占쏙옙熬��⑥����怨�占쏙옙占쏙옙, ����占쏙옙嶺�占썽�븐�곤옙占�, ����占쏙옙����������竊�, ����占쏙옙����占썬��由곤옙占쏙옙占�, ����占썲�β�わ옙占쏙㎖硫㏆옙占쎄�占쏙옙, ����留���������占쏙옙源�占쏙옙
		int result= new UserService().sitterUpdateEnd(id, newPw, email, phone, postNum, address, detailAddress, bankName,accountNo,accountName,img);
		
//		����占쎈����占쏙옙����占쎈���占쏙옙嶺�占썲��占�
		String msg = "";
		String loc = "";
		
//		����������占쏙���占쏙옙 ����占쏙옙 �����룟����占썲����占쏙옙嶺�占썲��������占� ����������由� ����占썲�������ル���� �β�わ옙占썲�占�
		if(result>0) {
			msg = "占쏙옙占쏙옙占쏙옙癰�占� 占쏙옙占쏙옙占쏙옙 占쎄��э옙占쏙옙占쏙옙�э옙占쏙옙占�.";
			// ����占썬��占썲��占� ����占썲����占쏙옙����占쏙옙 嶺�占쏙옙占쏙옙占썲����占쎈���占쏙옙嶺�占썲��占� - ����������占쏙옙�곤옙占쏙옙獄�占� ����占쏙옙嶺�占쏙옙占쏙옙占썲�β�쎌�� ����占쎌�듭��占쏙옙����由�����占쏙옙 �リ옇占쏙옙����占쏙옙 �띰옙����占썲��占� ����占쏙옙占썽�븐��占쎈���占쏙옙�β�쎌�� ����占쏙옙����占썲����由�����占쏙옙 嶺�占쏙옙��由��띰옙��占�
			loc = "/sitterInfo?userId="+id; 
		}
		else {
			msg = "占쏙옙占쏙옙占쏙옙癰�占� 占쏙옙占쏙옙占쏙옙 占썬�쏙옙��占쏙옙占쏙옙占쎈�э옙占쏙옙占�.";
			// ����占썬��占썲��占� ����占썲����占쏙옙����占쏙옙 嶺�占쏙옙占쏙옙占썲����占쎈���占쏙옙嶺�占썲��占� - ����占쎈�곗��占쏙옙����占쏙옙�곤옙��占� - ����占쎈�곗��占쏙옙����占쏙옙�곤옙��占� ����占쏙옙����占쏙옙 ����占쏙옙嶺�占쏙옙占쏙옙占썲�β�쎌�� ����占쎌�듭��占쏙옙����由�����占쏙옙 �リ옇占쏙옙����占쏙옙 �띰옙����占썲��占� ����占쏙옙占썽�븐��占쎈���占쏙옙�β�쎌�� ����占쏙옙����占썲����由�����占쏙옙 嶺�占쏙옙��由��띰옙��占�
			loc = "/sitterUpdateInfo?userId="+id; 
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
