package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.dto.PageDTO2;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
import com.service.TravelListService;

@Controller
public class TravelListController {
	
	@Autowired
	TravelListService service;
	
	// 일정보관함 (페이징 처리)
	@GetMapping("/travelList")
	public String list(HttpSession session, HttpServletRequest request, Model m) {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		
		if (dto != null) { // Null 체크를 수행
			String userID = dto.getUserID();
		    
		    String curPage = request.getParameter("curPage");
			if(curPage == null) {  
				curPage = "1";  //첫 화면 요청시 curPage를 1로 초기화
			}
			
			PageDTO2 pageDTO2 = service.list(Integer.parseInt(curPage), userID);  //사용자 ID를 전달하여 페이징된 데이터 가져오기 (정수)
			
		    m.addAttribute("pageDTO2", pageDTO2);  //모델에 페이징 데이터 추가
		    
		    return "travel/travelList";
		}
		
		 return "redirect:/loginForm";
	}
	
	// 일정 상세보기
	@GetMapping("/travelRetrieve")
	public String travelRetrieve(@RequestParam int travelID, Model m) {
		TravelListDTO dto = service.travelRetrieve(travelID);
		m.addAttribute("TravelListDTO", dto);
		return "travel/travelRetrieve";
	}	
	
	//TODO 트랜잭션 사용할 경우의 일정 상세보기 => 테스트중
//	@GetMapping("/travelRetrieve/{travelID}")
//	public String travelRetrieve(@PathVariable int travelID, Model m) {
//		TravelListDTO travelRetrieve = service.travelRetrieve(travelID);
//		PlanDTO planRetrieve = service.planRetrieve(travelID);
//		
//		m.addAttribute("TravelListDTO", travelRetrieve);
//		m.addAttribute("PlanDTO", planRetrieve);
//		
//		return "travel/travelRetrieve";
//	}
	
	// 일정 삭제하기
	@GetMapping("/travelDel")
	public String travelDel(@RequestParam("travelID") int travelID) {
		service.travelDel(travelID);
		return "redirect:travelList";
	}
}
