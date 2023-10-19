package com.service;

import java.util.List;

import com.dto.MemberDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;


public interface MyPageService {
	
	//회원 정보 확인
	public MemberDTO memberInfo(String userID);
	
	//회원 정보 수정
	public void memberUpdate(MemberDTO dto);
	
	//좋아요 목록
	public List<UserLikeDTO> userLikeList(String userid);
	
	//내가 쓴 글 목록
	public List<TravelDTO> writeList(String userid);

}
