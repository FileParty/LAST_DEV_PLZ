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
		String id = request.getParameter("userId"); // �븘�씠�뵒
		String email = request.getParameter("email"); // �씠硫붿씪
		String phone = request.getParameter("phone"); // �쑕��踰덊샇
		String postNum = request.getParameter("postNum"); // �슦�렪踰덊샇
		String address = request.getParameter("address"); //  �룄濡쒕챸 二쇱냼
		String detailAddress = request.getParameter("detail"); // �긽�꽭二쇱냼
		String bankName = request.getParameter("bankName");
		String accountNo=request.getParameter("accountNo");
		String accountName=request.getParameter("accountName");
		String pw = request.getParameter("nowpw"); // �쁽�옱 鍮꾨�踰덊샇
		String newPw = request.getParameter("newpw"); // �깉 鍮꾨�踰덊샇
		
		
		
//		�젙蹂� �닔�젙�븯湲� �쐞�빐 service濡� �뜲�씠�꽣瑜� 蹂대궦�떎(�븘�씠�뵒, �깉 鍮꾨�踰덊샇, �씠硫붿씪, �쑕���룿, �슦�렪踰덊샇, �룄濡쒕챸二쇱냼, �긽�꽭二쇱냼
		int result= new UserService().sitterUpdateEnd(id, newPw, email, phone, postNum, address, detailAddress, bankName,accountNo,accountName,img);
		
//		�쓳�떟�럹�씠吏�
		String msg = "";
		String loc = "";
		
//		���옣�씠 �옒 �릺�뿀�뒗吏��뿉 ���븳 �븞�궡湲� 濡쒖쭅
		if(result>0) {
			msg = "�쉶�썝�젙蹂닿� �닔�젙�릺�뿀�뒿�땲�떎";
			// �씪諛� �궗�슜�옄 留덉씠�럹�씠吏� - ���떆蹂대뱶 �솕硫댁쑝濡� �쟾�솚�븯�뒗 湲곕뒫�쓣 媛�吏� �꽌釉붾┸�쑝濡� �씠�룞�븯�뒗 留ㅽ븨媛�
			loc = "/userInfo?userId="+id; 
		}
		else {
			msg = "�쉶�썝�젙蹂� �닔�젙�씠 �떎�뙣�릺�뿀�뒿�땲�떎. �떎�떆 吏꾪뻾�빐二쇱꽭�슂.";
			// �씪諛� �궗�슜�옄 留덉씠�럹�씠吏� - �쉶�썝�젙蹂� - �쉶�썝�젙蹂� �닔�젙 �솕硫댁쑝濡� �쟾�솚�븯�뒗 湲곕뒫�쓣 媛�吏� �꽌釉붾┸�쑝濡� �씠�룞�븯�뒗 留ㅽ븨媛�
			loc = "/userUpdate?userId="+id; 
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
