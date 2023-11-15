package com.service;

import java.util.List;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
import com.dto.UserLikeDTO;


public interface MyPageService {
	
	//회원 정보 확인
	public MemberDTO memberInfo(String userID);
	
	//회원 정보 수정
	public void memberUpdate(MemberDTO dto);
	
	//일정보관함
//	public List<TravelDTO> travel(String userID);
	
	//좋아요 목록
	public List<UserLikeDTO> userLikeList(String userid);
	
	//내가 쓴 글 목록
	public List<BoardDTO> writeList(String userid);
	
	//회원 탈퇴하기
	public void memberDelete(MemberDTO dto);

	//비밀번호 체크
	public int checkPw(MemberDTO dto);
}
