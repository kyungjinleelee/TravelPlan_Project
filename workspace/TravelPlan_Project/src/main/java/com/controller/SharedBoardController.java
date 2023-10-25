package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.SharedBoardDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;
import com.service.MyPageService;
import com.service.SharedBoardService;

@Controller
public class SharedBoardController {

	@Autowired
	SharedBoardService service;

	// 일정 공유 게시판 화면
	@GetMapping("/SharedBoard")
	public String SharedBoard(HttpSession session, Model m) {
		List<SharedBoardDTO> SbDTOList = service.SharedBoard();
		m.addAttribute("SbDTOList", SbDTOList);
		return "SharedTravelBoard";
	}

	// 일정 공유 게시판 자세히보기
	/*
	 * 내 여행 보관함 넷 전부 dto 하나에? SharedBoardDTO 공유 여행계획 shared travel TCommentDTO 공유
	 * 여행계획 댓글 commentsOfTravel
	 * 
	 * TravelDTO 여행계획 travel PlanDTO 여행일정 plan
	 * 
	 * 디토 4개를 그대로 쓰는 방식, combinedDTO 하나를 새로 만드는 방식 중 그대로 쓰는 방식으로 함
	 * 
	 * SharedBoardDTO TCommentDTO TravelDTO PlanDTO
	 * 
	 * 일정공유 게시판 자세히 보기 SharedBoardDTO TCommentDTO
	 * 
	 */
	@GetMapping("/retrieve")
	public String findOne(@RequestParam int TravelID, Model m) {

		// List<UserLikeDTO> ulDTOList = service.userLikeList(userid);
		//트랜잭션 필요 할 수 있음
		TravelDTO dto = service.findOne(TravelID);//리퀘스트에 travelid 어떻게 넣을 건가
		List<PlanDTO> planDto = service.selectPlanList(TravelID);//리퀘스트에 travelid 어떻게 넣을 건가
		m.addAttribute("TravelDTO", dto);//dto
		m.addAttribute("PlanDTOList", planDto);//dto
		return "SharedTravelRetrieve";
	}

	// 여행계획(내 보관함)

}
