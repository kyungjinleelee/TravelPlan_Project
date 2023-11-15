package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dto.BoardDTO;
import com.service.BoardService;


@Controller
public class MainController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/main") // 메인 + 베스트게시글
	public String main(Model m) throws Exception {
		
		List<BoardDTO> list = service.bestList(); // 모델 (베스트게시글)
		m.addAttribute("list", list);
		return "main3";	// 뷰
	}

	
	@GetMapping("/ready")
	public String ready() {
		return "common/ready";
	}
	
	
}
