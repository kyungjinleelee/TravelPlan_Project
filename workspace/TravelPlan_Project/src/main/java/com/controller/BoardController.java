package com.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
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
	public String selectList(HttpServletRequest request, Model m) {
		String curPage = request.getParameter("curPage");
		//int로 바꾸는게 더 나을수도 있음.
		if(curPage == null) {
			curPage = "1";
		}
		
		PageDTO Dto = service.selectList(Integer.parseInt(curPage));
		//m.addAttribute("PageDTO", pageDTO);
		
		
		//List<BoardDTO> Dto = service.selectList();
		
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
		       
		        System.out.println(Dto.getBoardDate());
		        m.addAttribute("content", Dto);
		    }else {//현재는 로그인 안했으면 글 작성 불가. (유동 할지 생각중)
		    	return "board/accessDenied";
		    }
		
		return "board/Write";
	}
	
	@PostMapping("/write")
	public String write(BoardDTO dto, Model m) {
		 ZoneId zid = ZoneId.of("Asia/Seoul");
        ZonedDateTime krTime = ZonedDateTime.now().withZoneSameInstant(zid);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedTime = krTime.format(formatter);
        dto.setBoardDate(formattedTime);
		System.out.println(dto.getBoardDate());
		service.write(dto);
		
		return "redirect:Board";
	
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int contentNum) {
		service.delete(contentNum);
		System.out.println("요청됨.");
		return "redirect:Board";
	
	}
	
	//insertComment
	@GetMapping("/comment")
	public String comment(HttpSession session, CommentDTO Dto, 
			@RequestParam int contentNum, @RequestParam(value= "comment") String text) {
		System.out.println("호출됨.");
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if (loginInfo != null) {
	        String userID = loginInfo.getUserID();
	        Dto.setUserID(userID);
	        Dto.setContentNum(contentNum);
	        Dto.setComments(text);
	        //comment date 구하는 코드
	        LocalDateTime now = LocalDateTime.now();
	        ZoneId zid = ZoneId.of("Asia/Seoul");
	        ZonedDateTime krTime = ZonedDateTime.now().withZoneSameInstant(zid);
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedTime = krTime.format(formatter);
	        Dto.setCommentdate(formattedTime);
	        System.out.println(Dto.getCommentdate());
	    }else {//현재는 로그인 안했으면 댓글 작성 불가. (유동 할지 생각중)
	    	return "board/accessDenied";
	    }
		service.insertComment(Dto);
		return "redirect:BoardRetrieve?contentNum="+Dto.getContentNum();
	}
	
	//좋아요 처리 post로 바꿀 것
	@GetMapping("/UserLike")
	public String UserLike(HttpSession session, @RequestParam int contentNum) {
		//service.findOne(contentNum);
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		System.out.println("좋아요 처리 시작.");
		if (loginInfo != null) {
			System.out.println("로그인 상태임");
			//System.out.println(contentNum + loginInfo.getUserID());
			service.likeOne(contentNum, loginInfo.getUserID());
		}else {
			System.out.println("아이디와 불일치");
			return "board/UpdateAccessDenied";
		}
		return "redirect:BoardRetrieve?contentNum="+contentNum;
	}
	
	//내가 좋아요 한 게시판 처리
	@GetMapping("/UlList")
	public String UlList(HttpServletRequest request, HttpSession session, Model m) {
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");//로그인 아이디 확인.
		String curPage = request.getParameter("curPage");
		if(curPage == null) {
			curPage = "1";
		}
		PageDTO Dto =service.selectUserLikeList(Integer.parseInt(curPage),loginInfo.getUserID());
		m.addAttribute("content", Dto);
		return "board/user_like_list";
	}
	
	//좋아요 중복 확인
	@GetMapping("/likeDupCheck")
	@ResponseBody
	public int likeDupCheck(HttpSession session,@RequestParam int contentNum) {
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");//로그인 아이디 확인.
		int n=0;
		System.out.println("좋아요 중복 확인 처리 :");
		if (loginInfo != null) {
			String userID = loginInfo.getUserID();
			n =service.likeDuplicateCheck(userID, contentNum);
	        //m.addAttribute("return", n);
	        //return "redirect:BoardRetrieve?contentNum="+contentNum;
	        System.out.println("로그인 상태, n 값");
	        System.out.println(n);
	        return n;
	    }else {//현재는 로그인 안했으면 글 작성 불가. (유동 할지 생각중)
	    	//return "board/accessDenied";
	    	System.out.println("로그인 안한 상태 n 값,무관하게 404 리턴할 것.");
	        System.out.println(n);
	    	return 404;
	    }
		
		
	}
	
	
	public ResponseEntity<String> createComment(HttpSession session, @RequestBody CommentDTO Dto) {
        // commentData 객체에 contentNum과 comment 데이터가 매핑됩니다
        int contentNum = Dto.getContentNum();
        String comment = Dto.getComments();

        // 여기에서 contentNum과 comment 데이터를 사용하여 작업을 수행합니다

        
        System.out.println("호출됨.");
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if (loginInfo != null) {
	        String userID = loginInfo.getUserID();
	        Dto.setUserID(userID);
	        //comment date 구하는 코드
	        LocalDateTime now = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedTime = now.format(formatter);
	        Dto.setCommentdate(formattedTime);
	    }else {//현재는 로그인 안했으면 댓글 작성 불가. (유동 할지 생각중)
	    	//return "board/accessDenied";
	    }
		//service.insertComment(Dto);
		///return "redirect:Board";
		// 성공적인 응답을 반환
        return null;
    }
}
