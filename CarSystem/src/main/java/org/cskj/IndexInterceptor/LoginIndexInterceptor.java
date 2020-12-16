package org.cskj.IndexInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cskj.Bean.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIndexInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("1111");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user!=null) {
			return true;
		}
		response.sendRedirect("tologin");
		return false;
	}

}
