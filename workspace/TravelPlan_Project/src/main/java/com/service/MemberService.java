package com.service;

import java.util.HashMap;

import com.dto.MemberDTO;

public interface MemberService {
	
	// 로그인
	public MemberDTO login(HashMap<String, String> map);
}
