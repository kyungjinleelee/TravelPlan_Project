package com.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
import com.dto.UserLikeDTO;
import com.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	// 마이페이지
	@GetMapping("/loginCheck/mypage")
	public String mypage() {
		return "mypage";
	}
	
	// 회원 정보 확인
	@GetMapping("/memberInfo")
	public String memberInfo(HttpSession session) {
	    MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
	    if (loginInfo != null) {
	        String userID = loginInfo.getUserID();
	        MemberDTO memberInfo = service.memberInfo(userID);
	        session.setAttribute("loginInfo", memberInfo); // 업데이트된 정보로 세션 업데이트
	    }
	    return "mypage/memberInfo";
	}
	
	// 회원 정보 수정 화면 요청
	@GetMapping("/MemberUpdateForm")
	public String memberUpdateForm() {
		return "mypage/memberUpdateForm";
	}
	
	// 회원 정보 수정
	@PostMapping("/memberUpdate")
	public String memberUpdate(HttpSession session, MemberDTO updatedDTO) {
	  MemberDTO currentDTO = (MemberDTO) session.getAttribute("loginInfo"); //현재 로그인 정보 가져와 currentDTO에 저장
	  updatedDTO.setUserID(currentDTO.getUserID());    //currentDTO에서 가져온 정보를 updatedDTO에 업데이트
	  service.memberUpdate(updatedDTO); //updatedDTO를 사용하여 회원 정보 업데이트
	  session.setAttribute("loginInfo", updatedDTO);   //수정된 정보를 세션에 다시 저장
	  return "redirect:mypage"; // 수정 후 회원 정보 페이지로 이동해 업데이트 된 회원 정보 확인
	}
	
	// 일정보관함
//	@GetMapping("/travelList")
//	public String myPlan(HttpSession session, Model m) {
//		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
//		if (dto != null) { // Null 체크를 수행
//			String userID = ((MemberDTO) session.getAttribute("loginInfo")).getUserID();
//		    List<TravelDTO> travelList = service.travel(userID);
//		    m.addAttribute("travelList", travelList);
//		}
//	    return "mypage/travelList";
//	}	
	
	// 좋아요 목록
		@GetMapping("/likeList")
		public String likeList(HttpSession session ,Model m) {
			MemberDTO dto = (MemberDTO)session.getAttribute("login");
			String userid = dto.getUserID();
			
			List<UserLikeDTO> ulDTOList = service.userLikeList(userid);
			//모델저장
			m.addAttribute("ulDTOList",ulDTOList);
			
			return "mypage/likeList";
		}
	
	// 내가 쓴 글 목록
		@GetMapping("/writeList")
		public String writeList(HttpSession session ,Model m) {
			//MemberDTO dto = (MemberDTO)session.getAttribute("login");
			//String userid = dto.getUserID();
			MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
			String userid = ((MemberDTO) session.getAttribute("loginInfo")).getUserID();
			
			System.out.println(userid);
			System.out.println("===========================");
			if (userid==null) {
				System.out.println("로그인 안돼서 그럼");
				}
			//List<TravelDTO> wDTOList = service.writeList(userid); //이건 여행계획
			List<BoardDTO> wDTOList = service.writeList(userid);
			//모델저장
			m.addAttribute("wDTOList",wDTOList);
			
			return "mypage/writeList";
		}
		
	// 탈퇴페이지 요청
		@GetMapping("/memberDeleteForm")
		public String delMemberView() {
			return "mypage/memberDeleteForm";
		}
	
	// 회원 탈퇴
		@PostMapping("/memberDelete")
		public String memberDelete(MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
			MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");   //세션에 있는 loginInfo 정보를 가져와 loginInfo변수에 넣어줌
			//loginInfo 객체가 null인지 확인
		    if (loginInfo != null) {
				String sessionPasswd = loginInfo.getPasswd();  //세션에 있는 비밀번호
				String dtoPasswd = dto.getPasswd();  //dto로 들어오는 비밀번호
			
				if (!sessionPasswd.equals(dtoPasswd)) { //두 개의 비밀번호를 비교
		            rttr.addFlashAttribute("msg", false); //일치하지 않으면 msg에 false 값을 넣어서 form에 전달
		            return "redirect:memberDeleteForm";
		        } else {
		            service.memberDelete(dto); //일치할 경우 회원 삭제
		            session.invalidate(); //세션 무효화
		            return "redirect:main";
		        }
		    } else {
		        //loginInfo 세션 속성이 존재하지 않거나 null일 때 처리
		        return "redirect:loginForm"; //로그인 페이지로 리다이렉트
		    }
		}
		
	//비밀번호 체크
		@PostMapping("/checkPw")
		@ResponseBody
		public int checkPw(MemberDTO dto) {
			int result = service.checkPw(dto);
			return result;    // 일치한다면 1 반환
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
