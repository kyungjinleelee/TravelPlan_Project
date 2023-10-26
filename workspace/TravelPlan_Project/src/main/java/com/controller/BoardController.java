package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.service.BoardServiceImpl;
import com.service.SharedBoardService;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	//board service 만들기 v
	//댓글 가져오는 서비스
	// c: r: BoardRetrieve,Board u:  d
	@GetMapping("/BoardRetrieve")
	public String findOne(@RequestParam int contentNum, Model m) {
		//트랜잭션 필요 할 수 있음
		BoardDTO dto = service.findOne(contentNum);
		List<CommentDTO> contentDto = service.selectCommentList(contentNum);
		m.addAttribute("content", dto);//dto
		m.addAttribute("comment", contentDto);//dto
		return "board/BoardRetrieve";
		
	
	}
	@GetMapping("/Board")
	public String selectList(Model m) {
		List<BoardDTO> Dto = service.selectList();
		m.addAttribute("content", Dto);
		return "board/Board";
	
	}
	
	
	@GetMapping("/UpdateRequest")
	public String update(@RequestParam int contentNum, Model m) {
		BoardDTO dto = service.findOne(contentNum);
		m.addAttribute("content", dto);//dto
		return "board/BoardContentUpdate";
		
	}
	
	@PostMapping("/update")
	public String update(BoardDTO dto) {
		service.update(dto);
		return "redirect:Board";
	
	}
	
	
	@PostMapping("/delete")
	public String delete(Model m) {
		List<BoardDTO> Dto = service.selectList();
		m.addAttribute("content", Dto);
		return "board/Board";
	
	}
	
	@PostMapping("/write")
	public String write(Model m) {
		List<BoardDTO> Dto = service.selectList();
		m.addAttribute("content", Dto);
		return "board/Board";
	
	}
}
