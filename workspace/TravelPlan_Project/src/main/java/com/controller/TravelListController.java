package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.dto.TravelListDTO;
import com.service.TravelListService;

@Controller
public class TravelListController {
	
	@Autowired
	TravelListService service;
	
	// 일정보관함
	@GetMapping("/travelList")
	public String myPlan(HttpSession session, Model m) {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if (dto != null) { // Null 체크를 수행
			String userID = ((MemberDTO) session.getAttribute("loginInfo")).getUserID();
		    List<TravelListDTO> travelList = service.travel(userID);
		    m.addAttribute("travelList", travelList);
		}
	    return "travel/travelList";
	}	
	
	// 일정 상세보기
	@GetMapping("/travelRetrieve")
	public String travelRetrieve(@RequestParam int travelID, Model m) {
		TravelListDTO dto = service.travelRetrieve(travelID);
		m.addAttribute("TravelListDTO", dto);
		return "travel/travelRetrieve";
	}	
	
	// 일정 삭제하기
	@GetMapping("/travelDel")
	public String travelDel(@RequestParam("travelID") int travelID) {
		service.travelDel(travelID);
		return "redirect:travelList";
	}
}
