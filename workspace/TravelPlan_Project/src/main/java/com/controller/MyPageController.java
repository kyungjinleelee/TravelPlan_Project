package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService service;

	// ȸ����������
	@GetMapping("/memberUpdate")
	public String memberUpdate() {

		return "memberUpdate";//
	}

	// ���� ������
	@GetMapping("/myplan")
	public String myplan() {

		return "myplan";
	}

	// ���ƿ� ���
	@GetMapping("/likeList")
	public String likeList() {
		
		
		
		return "";
	}

	// ���� �� �� ���
	@GetMapping("/writeList")
	public String writeList() {
		return "";
	}
}
