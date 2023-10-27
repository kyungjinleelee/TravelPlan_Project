package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.MemberDTO;
import com.service.BoardServiceImpl;
import com.service.MyPageServiceImpl;
import com.service.SharedBoardService;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	
	@Autowired
	MyPageServiceImpl myPageService;
	
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
	public String update(@RequestParam("contentNum") int contentNum, @RequestParam("userid") String userid, Model m ,HttpSession session ) {
		System.out.println("요청시작");
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");//로그인 아이디 확인.
		System.out.println("작성자 아이디"+ userid);
		System.out.println("로그인 아이디");//이건 로그인 없으면 아예 출력도 안됨.
		if (userid != null && loginInfo != null && userid.equals(loginInfo.getUserID())) {
			System.out.println("아이디 일치 확인");
			BoardDTO dto = service.findOne(contentNum);
			m.addAttribute("content", dto);//dto
			return "board/BoardContentUpdate";
		}else {
			System.out.println("아이디와 불일치");
			return "board/UpdateAccessDenied";
		}
		
		
	}
	
	@PostMapping("/update")
	public String update(BoardDTO dto) {
		service.update(dto);
		return "redirect:Board";
	}
	
	@GetMapping("/WriteRequest")
	public String write(HttpSession session, Model m, BoardDTO Dto) {
		  MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		  //로그인 상태를 확인하고 (유동 아직 없음) 작성자 아이디만 초기값 형태로 
		  //응답 전송하고, 아이디는 다시 요청으로 받음 
		    if (loginInfo != null) {
		        String userID = loginInfo.getUserID();
		        Dto.setUserID(userID);
		        //session.setAttribute("loginInfo", memberInfo);
		        m.addAttribute("content", Dto);
		    }else {//현재는 로그인 안했으면 글 작성 불가. (유동 할지 생각중)
		    	return "board/accessDenied";
		    }
		
		return "board/Write";
	}
	
	@PostMapping("/write")
	public String write(BoardDTO dto) {
		service.write(dto);
		return "redirect:Board";
	
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int contentNum) {
		service.delete(contentNum);
		System.out.println("요청됨.");
		return "redirect:Board";
	
	}
	
	
}
