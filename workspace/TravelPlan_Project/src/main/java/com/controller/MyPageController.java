package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;
import com.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	

	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
	// 회원 정보 확인
	@GetMapping("/memberInfo")
	public String memberInfo(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
// 주석 처리 해야 NullException 발생안하고 실행됨 => 이유 찾는중		
//		String userID = dto.getUserID();
//		MemberDTO memberInfo = service.memberInfo(userID);
//		session.setAttribute("login", memberInfo);
		return "mypage/memberInfo";
	}
	
	
	// 회원 정보 수정 화면 요청
	@GetMapping("/MemberUpdateForm")
	public String memberUpdateForm() {
		return "mypage/memberUpdateForm";
	}
	
	// 회원 정보 수정
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberDTO dto, HttpSession session) {
		service.memberUpdate(dto);    //파라미터들을 service.memberUpdate(dto)에 넣어줘서 service로 보냄
//		service.memberUpdate("userID", "model");
		return "redirect:mypage/memberUpdate";
	}
	
	
	// 일정보관함
	@GetMapping("/myPlan")
	public String myPlan(HttpSession session, Model m) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userID = dto.getUserID();
		List<PlanDTO> planList = service.myPlan(userID);
		m.addAttribute("planList", planList);
		
		return "myPlan";
	}
	
	// 좋아요 목록
		@GetMapping("/LikeList")
		public String likeList(HttpSession session ,Model m) {
			MemberDTO dto = (MemberDTO)session.getAttribute("login");
			String userid = dto.getUserID();
			
			List<UserLikeDTO> ulDTOList = service.userLikeList(userid);
			//모델저장
			m.addAttribute("ulDTOList",ulDTOList);
			
			return "likeList";
		}
	
	// 내가 쓴 글 목록
		@GetMapping("/WriteList")
		public String writeList(HttpSession session ,Model m) {
			MemberDTO dto = (MemberDTO)session.getAttribute("login");
			String userid = dto.getUserID();
			
			List<TravelDTO> wDTOList = service.writeList(userid);
			//모델저장
			m.addAttribute("wDTOList",wDTOList);
			
			return "writeList";
		}
		
	
		/*
		 * // 세션을 생성하기 전에 기존의 세션 파기
	        httpServletRequest.getSession().invalidate();
	        HttpSession session = httpServletRequest.getSession(true);  // Session이 없으면 생성
	        // 세션에 userId를 넣어줌
	        session.setAttribute("userId", user.getId());
	        session.setMaxInactiveInterval(1800); // Session이 30분동안 유지
		 */
	

}
