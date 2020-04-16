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
		String id = request.getParameter("userId"); // 占쎈�占쎌��占쎈�
		String email = request.getParameter("email"); // 占쎌��筌�遺우��
		String phone = request.getParameter("phone"); // 占쎌��占쏙옙甕곕����
		String postNum = request.getParameter("postNum"); // 占쎌��占쎈�よ린����
		String address = request.getParameter("address"); //  占쎈�嚥≪��梨� 雅��깅��
		String detailAddress = request.getParameter("detail"); // 占쎄맒占쎄쉭雅��깅��
		String bankName = request.getParameter("bankName");
		String accountNo=request.getParameter("accountNo");
		String accountName=request.getParameter("accountName");
		String pw = request.getParameter("nowpw"); // 占쎌�쏙옙�� ��袁⑨옙甕곕����
		String newPw = request.getParameter("newpw"); // 占쎄� ��袁⑨옙甕곕����
		
		
		
//		占쎌��癰�占� 占쎈��占쎌��占쎈릭疫뀐옙 占쎌��占쎈� service嚥∽옙 占쎈�뀐옙��占쎄숲��占� 癰���沅�占쎈��(占쎈�占쎌��占쎈�, 占쎄� ��袁⑨옙甕곕����, 占쎌��筌�遺우��, 占쎌��占쏙옙占쎈？, 占쎌��占쎈�よ린����, 占쎈�嚥≪��梨멧��깅��, 占쎄맒占쎄쉭雅��깅��
		int result= new UserService().sitterUpdateEnd(id, newPw, email, phone, postNum, address, detailAddress, bankName,accountNo,accountName,img);
		
//		占쎌�놂옙��占쎈�뱄옙��筌�占�
		String msg = "";
		String loc = "";
		
//		占쏙옙占쎌�ｏ옙�� 占쎌�� 占쎈┷占쎈�占쎈��筌�占쏙옙肉� 占쏙옙占쎈립 占쎈�占쎄땀疫뀐옙 嚥≪��彛�
		if(result>0) {
			msg = "������蹂� ������ �깃났�����듬����.";
			// 占쎌�よ�占� 占쎄�占쎌��占쎌�� 筌�����占쎈�뱄옙��筌�占� - 占쏙옙占쎈��癰���諭� 占쎌��筌�����嚥∽옙 占쎌�억옙��占쎈릭占쎈�� 疫꿸��ワ옙�� 揶�占쏙�占� 占쎄���遺얄�몌옙��嚥∽옙 占쎌��占쎈�占쎈릭占쎈�� 筌��쎈릅揶�占�
			loc = "/sitterInfo?userId="+id; 
		}
		else {
			msg = "������蹂� ������ �ㅽ�⑦�����듬����.";
			// 占쎌�よ�占� 占쎄�占쎌��占쎌�� 筌�����占쎈�뱄옙��筌�占� - 占쎌�띰옙��占쎌��癰�占� - 占쎌�띰옙��占쎌��癰�占� 占쎈��占쎌�� 占쎌��筌�����嚥∽옙 占쎌�억옙��占쎈릭占쎈�� 疫꿸��ワ옙�� 揶�占쏙�占� 占쎄���遺얄�몌옙��嚥∽옙 占쎌��占쎈�占쎈릭占쎈�� 筌��쎈릅揶�占�
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
