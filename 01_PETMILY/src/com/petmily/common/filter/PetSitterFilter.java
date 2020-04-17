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
//		怨듯넻�쟻�쑝濡� 留덉씠�럹�씠吏��뒗 濡쒓렇�씤�븳 �렖�떆�꽣 �궗�슜�옄留� �젒洹쇳븷 �닔 �엳�룄濡� �꽕�젙�븳�떎.
		User u=(User)((HttpServletRequest)request).getSession().getAttribute("loginUser");
		if(u == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("loc", "/log-in"); // 濡쒓렇�씤 �솕硫댁쑝濡� �씠�룞
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
			if(!u.getUserType().equals("펫시터")) {
				request.setAttribute("msg", "펫시터만 접근할 수 있는 서비스입니다.");
				request.setAttribute("loc", ""); // 硫붿씤�쑝濡� �씠�룞
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
