package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MyPageDAO;
import com.dto.MemberDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO dao;         //DAO 주입받기

	//수정할 회원 정보 가져오기
	@Override
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = dao.memberInfo(userID);
		return dto;
	}

//	@Override
//	public MemberDTO memberUpdate(String userID) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
