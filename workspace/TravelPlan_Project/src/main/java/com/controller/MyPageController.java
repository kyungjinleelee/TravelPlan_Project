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
	@GetMapping("/memberUpdate")
	public String memberUpdate() {

		return "memberUpdate";//
	}

	// 일정 보관함
	@GetMapping("/myplan")
	public String myplan() {

		return "myplan";
	}

	// 좋아요 목록
	@GetMapping("/likeList")
	public String likeList() {
		
		
		
		return "";
	}

	// 내가 쓴 글 목록
	@GetMapping("/writeList")
	public String writeList() {
		return "";
	}
}
