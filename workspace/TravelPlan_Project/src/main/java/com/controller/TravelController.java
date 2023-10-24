package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.service.TravelService;

@Controller
public class TravelController {

	@Autowired
	TravelService service;
	
	// 메인UI
	@GetMapping("/travelUI")
	public String travelUI() {
		return "travelForm";
	}
}
