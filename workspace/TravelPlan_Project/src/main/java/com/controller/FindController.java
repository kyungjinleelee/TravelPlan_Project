package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class FindController {

	@Autowired
	MemberService service;
	
	// 아이디 찾기 폼
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "findIdForm";
	}
	
	// 아이디 찾기
	@PostMapping("/findId")
    public String findId(MemberDTO dto, Model model) throws Exception{
        List<MemberDTO> idList = service.findId(dto);
        model.addAttribute("idList", idList);
        return "member/findIdResult";
    }
	
	// 비밀번호 찾기 폼
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "findPwForm";
	}
	
	// 비밀번호 재설정 메일 전송
	@PostMapping("/findPwSendMail")
	public String findPwSendMail(MemberDTO dto, Model model) throws Exception{
		int num = service.findPw_email(dto);
		// 아이디와 이메일이 입력했던 정보와 다름
		if(num == 0) {
			return "member/findPwFail";
		}
		// 이메일 인증이 되어있지 않음
		if (num == 1) {
			return "member/emailAuthFail";
		}
		return "member/findPwSendMail";
	}
	
	// 비밀번호 재설정폼 (메일에서 링크 클릭 시 이쪽으로 이동)
	@GetMapping("/resetPw") // 이후 post로 변경하기
	public String resetPw(MemberDTO dto, HttpSession session) {
		session.setAttribute("resetPwInfo", dto); // resetPw.jsp에서 사용하기 위함
		int num = service.checkKey(dto);
		if (num == 0) { // DB와 키값이 다르면 만료되었다고 알림
			return "member/checkKeyFail";
		}
		return "member/resetPw"; // 정상적이면 비밀번호 재설정
	}
	
	// 비밀번호 재설정 성공 / 실패 alert
	@PostMapping("pwAlert")
	public String pwAlert(MemberDTO dto, HttpSession session) {
		int num = service.newPw(dto);
		if(num == 0) {
			return "member/pwAlertFail";
		}
		session.removeAttribute("resetPwInfo"); // 세션 데이터 삭제
		return "member/pwAlert";
	}
}
