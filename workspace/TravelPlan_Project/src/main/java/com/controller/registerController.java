package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class registerController {

	@Autowired
	MemberService service;
	
	// 신규 회원 입력화면
	@GetMapping("/memberUI")
//	@RequestMapping(value="/memberUI", method= {RequestMethod.GET, RequestMethod.POST})
	public String memberUI() {
		return "registerForm";
	}
	
	@PostMapping("/register")
	public String register(MemberDTO dto) {
		int n = service.register(dto);
		return "redirect:loginForm";
	}
	// 신규 회원 등록 (21강)
	
	// 아이디 중복체크 (ajax 연동을 위해 의존성 추가 필요)
	@GetMapping("/memberIdCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userID")
							String userID) {
		MemberDTO dto = service.idCheck(userID);
		String mesg = "아이디 사용 가능";
		if(dto != null) {
			mesg = "아이디 중복";
		}
		return mesg;
	}
	
	// 유효성 검사 추가
}