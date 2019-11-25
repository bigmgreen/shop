package com.shop.utils;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 检查用户是在登陆状态
 * 
 * @author admin
 */
public class LoginFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// 从session中获取登录者实体
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		if (null != cookies) {			
			for (Cookie c : cookies) {
				if ("userId".equals(c.getName())) {
					cookie = c;
					break;
				}
			}
		}
		if (cookie == null) {
			response.sendRedirect("/shop/login.html");
		} else if (null == request.getSession().getAttribute(cookie.getValue())) {
			response.sendRedirect("/shop/login.html");
		} else {
			filterChain.doFilter(request, response);
		}
	}

}
