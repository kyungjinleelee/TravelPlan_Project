package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dto.MemberDTO;

@Component("loginCheckInterceptor")
public class LoginCheckHandlerInterceptor extends HandlerInterceptorAdapter  {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 체크 여부 확인
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo"); // 세션에 있는 login정보 저장
		
		if(dto == null) {// 저장이 안된 경우 -> 로그인 X
			response.sendRedirect("/app/loginForm"); // 로그인하도록 유도
			return false; // false이기  때문에 interceptor가 적용된 Controller는 실행되지 않음
		}
		return true; // null값이 아니라면 dto에 로그인 정보 저장 -> 로그인 O
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}
