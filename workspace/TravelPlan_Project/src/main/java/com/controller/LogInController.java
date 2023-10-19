package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LogInController {

	@Autowired
	MemberService service;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam HashMap<String, String> map, HttpSession session) {
		
		MemberDTO dto = service.login(map);
		
		if(dto!=null) { // 로그인 성공
			session.setAttribute("loginInfo", dto); // 로그인정보 저장
			return "redirect:main";			
		}
		else {
			return "member/loginFail";
		}
	}
	
	@GetMapping("/loginCheck/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main";
	}
	

}
