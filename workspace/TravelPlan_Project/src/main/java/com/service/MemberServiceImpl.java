package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	// 회원가입
	@Override
	public int register(MemberDTO dto) {
		int n = dao.register(dto);
		return 0;
	}
	
	//id 중복 체크
	@Override
	public MemberDTO idCheck(String userID) {
		MemberDTO dto = dao.idCheck(userID);
		return dto;
	}
	// 로그인
	@Override
	public MemberDTO login(HashMap<String, String> map) {
		return dao.login(map);
	}



}
