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
import com.info.Info;
import com.service.PlanService;
import com.service.PlanServiceImpl;
import com.service.TravelListService;
import com.service.TravelListServiceImpl;

@Controller
public class TravelListController {
	private Info info = new Info();
	
	@Autowired
	TravelListServiceImpl service;
	
//	@Autowired
//	PlanServiceImpl planservice;
	
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
	
	// 일정 상세보기 => TravelListDTO만
//	@GetMapping("/travelRetrieve")
//	public String travelRetrieve(@RequestParam int travelID, Model m) {
//		TravelListDTO dto = service.travelRetrieve(travelID);
//		m.addAttribute("TravelListDTO", dto);
//		return "travel/travelRetrieve";
//	}	
	
	// 일정 상세보기 => TravelListDTO, PlanDTO
	@GetMapping("/travelRetrieve")
	public String travelRetrieve(@RequestParam int travelID, Model m, HttpSession session) {
		
		session.setAttribute("client_id", info.getKakaoMapId());
		
		TravelListDTO travelRetrieve = service.travelRetrieve(travelID);  
		List<PlanDTO> planList = service.planList(travelID);  
		PlanDTO plan = service.plan(travelID);    
		
		m.addAttribute("travelListDTO", travelRetrieve);  //모델에 TravelListDTO 객체 추가
		m.addAttribute("planList", planList);  //모델에 PlanDTO 객체 추가
		m.addAttribute("planDTO", plan);
		
		return "travel/travelRetrieve";
	}	
	
	// 일정 삭제하기
	@GetMapping("/travelDel")
	public String travelDel(@RequestParam("travelID") int travelID) {
		service.travelDel(travelID);
		return "redirect:travelList";
	}
}
