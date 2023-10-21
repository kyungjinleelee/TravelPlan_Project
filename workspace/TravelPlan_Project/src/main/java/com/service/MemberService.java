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
	
	// 이메일당 가입된 아이디 개수
	public int idPerEmailCount(String email);
	
	// 아이디 찾기
	public List<MemberDTO> findId(MemberDTO dto);
	
	// 인증키 일치 확인
	public int checkKey(MemberDTO dto);
		
	// 비밀번호 찾기
	public int findPw_email(MemberDTO dto) throws Exception;
	
	// 비밀번호 재설정
	public int newPw(MemberDTO dto);
}
