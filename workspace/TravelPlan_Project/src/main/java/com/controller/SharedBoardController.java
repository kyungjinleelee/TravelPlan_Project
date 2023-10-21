package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.UserLikeDTO;

@Controller
public class SharedBoardController {

	// 일정 공유 게시판 화면
	@GetMapping("/SharedBoard")
	public String main() {
		return "SharedTravelBoard";
	}

	// 자세히보기
	@GetMapping("/retrieve")
	public String findOne(@RequestParam int TravelID, Model m) {
		/*넷 전부 dto 하나에?
		SharedBoardDTO 공유 여행계획 shared travel
		TCommentDTO 공유 여행계획 댓글 commentsOfTravel
		
		TravelDTO 여행계획 travel
		PlanDTO 여행일정 plan	
		*/
		//List<UserLikeDTO> ulDTOList = service.userLikeList(userid);
		
		//m.addAttribute("dto", dto);
		return "SharedTravelRetrieve";
	}

}
