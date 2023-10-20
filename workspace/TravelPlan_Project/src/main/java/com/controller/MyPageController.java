package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.dto.MemberDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;
import com.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
// memberInfo.jsp로 잘 가는지 확인	
//	@GetMapping("/aaa")
//	public String aaa() {
//	return "mypage/memberInfo";
//}
//	
//// mypage.jsp로 잘 가는지 확인	
//	@GetMapping("/bbb")
//	public String bbb() {
//		return "mypage";
//	}
	
	// 회원 정보 확인
	@GetMapping("/MemberInfo")
	public String memberInfo(HttpSession session) {
		MemberDTO dto =
				  (MemberDTO)session.getAttribute("login");
		String userID = dto.getUserID();
		MemberDTO memberInfo = service.memberInfo(userID);
		session.setAttribute("login", memberInfo);
		
		return "mypage/memberInfo";
	}
	
	// 회원 정보 수정 화면 요청
//	@GetMapping("/MemberUpdateForm")
//	public String memberUpdateForm(String userID, Model model) {
//		//선택한 고객의 정보를 DB에서 조회해온 후
//		//수정 화면에 출력할 수 있도록 Model에 담는다
//		model.addAttribute("dto", service.memberInfo(userID));
//		return "redirect:/mypage/memberUpdateForm";
//	}
	
	// 회원 정보 수정
	@PostMapping("/MemberUpdate")
	public String memberUpdate(MemberDTO dto) {
		service.memberUpdate(dto);    //파라미터들을 service.memberUpdate(dto)에 넣어줘서 service로 보냄
//		service.memberUpdate("userID", "model");
		return "redirect:/mypage/memberUpdate";
	}
	
	
	// 일정보관함
	@GetMapping("/MyPlan")
	public String myPlan() {
		
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
