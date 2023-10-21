package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	// 신규 회원 등록
	@PostMapping("/register")
	public String register(MemberDTO dto) throws Exception {
		if(service.idPerEmailCount(dto.getEmail()) == 0) {
			return "member/registerFail_email";
		}
		service.register(dto);
		return "redirect:loginForm";
	}
	
	// 회원가입시 이메일 인증
	@GetMapping("/registerEmail")
	public String emailConfirm(MemberDTO dto) throws Exception {
		service.updateMailAuth(dto);
		return "member/emailAuthSuccess";
	}
	
	// 아이디 중복체크 (ajax 연동을 위해 의존성 추가 필요)
	@GetMapping(value = "/memberIdCheck", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String idCheck(@RequestParam("userID")
							String userID) {
		MemberDTO dto = service.idCheck(userID);
		String msg = "사용 가능한 아이디입니다.";
		if(dto != null) {
			msg = "중복된 아이디입니다.";
		}
		return msg;
	}
	
}
