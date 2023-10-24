package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MyPageDAO;
import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO dao;         //DAO 주입받기

	//회원 정보 확인
	@Override
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = dao.memberInfo(userID);
		return dto;
	}

	//회원 정보 수정
	@Override
	public void memberUpdate(MemberDTO dto) {      //Controller에서 보내는 파라미터들을 memberUpdate(MemberDTO dto)로 받고
		dao.memberUpdate(dto);    //받은 dto를 DAO로 보냄
	}
	
	//일정보관함
	@Override
	public List<PlanDTO> myPlan(String userID) {
		List<PlanDTO> list = dao.myPlan(userID);
		return list;
	}
	
	//좋아요 목록
	@Override
	public List<UserLikeDTO> userLikeList(String userID) {
		List<UserLikeDTO> list = dao.userLikeList(userID);
		return list;
	}

	//내가 쓴 글 목록
	@Override
	public List<BoardDTO> writeList(String userID) {
		List<BoardDTO> list = dao.writeList(userID);
		return list;
	}
	
}
