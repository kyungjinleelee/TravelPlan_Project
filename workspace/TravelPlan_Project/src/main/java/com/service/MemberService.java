package com.service;

import java.util.HashMap;
import java.util.List;

import com.dto.MemberDTO;

public interface MemberService {
	// 회원가입 
	public void register(MemberDTO dto) throws Exception;
	// 로그인
	public MemberDTO login(HashMap<String, String> map);
	public MemberDTO idCheck(String userID);
	
	// 이메일 인증
	public int updateMailKey(MemberDTO dto) throws Exception;
	public int updateMailAuth(MemberDTO dto) throws Exception;
	public int emailAuthFail(String userID) throws Exception;
	
	// 아이디 찾기
	public List<MemberDTO> findId(MemberDTO dto);
}
