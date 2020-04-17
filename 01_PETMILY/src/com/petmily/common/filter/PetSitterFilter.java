package com.petmily.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.petmily.user.model.vo.User;


@WebFilter("/sitter/*")
public class PetSitterFilter implements Filter {


    public PetSitterFilter() {
    }


	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		공통적으로 마이페이지는 로그인한 펫시터 사용자만 접근할 수 있도록 설정한다.
		User u=(User)((HttpServletRequest)request).getSession().getAttribute("loginUser");
		if(u == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("loc", "/log-in"); // 로그인 화면으로 이동
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
			if(!u.getUserType().equals("펫시터")) {
				request.setAttribute("msg", "펫시터만 접근할 수 있는 서비스입니다.");
				request.setAttribute("loc", ""); // 메인으로 이동
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);			
			}
			else {
				chain.doFilter(request, response);		
			}
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {
	}

}
