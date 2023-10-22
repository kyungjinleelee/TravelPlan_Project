package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/ready")
	public String ready() {
		return "common/ready";
	}
}
