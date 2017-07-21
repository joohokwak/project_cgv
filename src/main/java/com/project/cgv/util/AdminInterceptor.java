package com.project.cgv.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HashMap<String,Object> member = (HashMap<String,Object>) request.getSession().getAttribute("member");
		
		String id = null;
		
		if(member != null){
			id = (String) member.get("id"); 
		}
		
		if(id == null || !(id.equals("admin"))){
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}

}
