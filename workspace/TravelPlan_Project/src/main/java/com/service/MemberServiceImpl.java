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

	// 로그인
	@Override
	public MemberDTO login(HashMap<String, String> map) {
		return dao.login(map);
	}
	
	

}
