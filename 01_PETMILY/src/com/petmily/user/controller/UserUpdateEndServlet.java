package com.petmily.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;


@WebServlet("/user/UpdateEnd")
public class UserUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UserUpdateEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		������蹂� �������� 濡�吏�
		String id = request.getParameter("userId"); // ���대��
		String email = request.getParameter("email"); // �대���
		String phone = request.getParameter("phone"); // �대��踰���
		String postNum = request.getParameter("postNum"); // �고�몃���
		String address = request.getParameter("address"); //  ��濡�紐� 二쇱��
		String detailAddress = request.getParameter("detail"); // ���몄＜��
		String pw = request.getParameter("nowpw"); // ���� 鍮�諛�踰���
		String newPw = request.getParameter("newpw"); // �� 鍮�諛�踰���
		
		System.out.println("UserUpdateEndServlet id 媛� : "+id);
		System.out.println("UserUpdateEndServlet email 媛� : "+email);
		System.out.println("UserUpdateEndServlet phone 媛� : "+phone);
		System.out.println("UserUpdateEndServlet postNum 媛� : "+postNum);
		System.out.println("UserUpdateEndServlet address 媛� : "+address);
		System.out.println("UserUpdateEndServlet detailAddress 媛� : "+detailAddress);
		System.out.println("UserUpdateEndServlet pw 媛� : "+pw);
		System.out.println("UserUpdateEndServlet newPw 媛� : "+newPw);
		
//		��蹂� ������湲� ���� service濡� �곗�댄�곕�� 蹂대�몃��(���대��, �� 鍮�諛�踰���, �대���, �대����, �고�몃���, ��濡�紐�二쇱��, ���몄＜��
		int result = new UserService().userUpdate(id, newPw, email, phone, postNum, address, detailAddress);
		
//		���듯���댁�
		String msg = "";
		String loc = "";
		
//		//      저장이 잘 되었는지에 대한 안내글 로직
	      if(result>0) {
	          msg = "회원정보가 수정되었습니다";
	          // 일반 사용자 마이페이지 - 대시보드 화면으로 전환하는 기능을 가진 서블릿으로 이동하는 매핑값
	          loc = "/userInfo?userId="+id; 
	       }
	       else {
	          msg = "회원정보 수정이 실패되었습니다. 다시 진행해주세요.";
	          // 일반 사용자 마이페이지 - 회원정보 - 회원정보 수정 화면으로 전환하는 기능을 가진 서블릿으로 이동하는 매핑값
	          loc = "/userUpdate?userId="+id; 
	       }
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
