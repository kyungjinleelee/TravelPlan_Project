package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	// 회원정보수정
	@GetMapping("/MemberUpdate")
	public String memberUpdate() {
		
		return "memberUpdate";
	}
	
	// 일정보관함
	@GetMapping("/MyPlan")
	public String myPlan() {
		
		return "myPlan";
	}
	
	// 좋아요 목록
	@GetMapping("/LikeList")
	public String likeList() {
		
		return "likeList";
	}
	
	// 내가 쓴 글 목록
	@GetMapping("/WriteList")
	public String writeList() {
		
		return "writeList";
	}
	
	

}
