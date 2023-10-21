package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;
	
	// 회원가입
	public void register(MemberDTO dto) throws Exception {
		session.insert("MemberMapper.register", dto);
	}
	// id 중복체크
	public MemberDTO idCheck(String userID) {
		MemberDTO dto = session.selectOne("MemberMapper.idCheck", userID);
		return dto;
	}
	
	// 로그인
	public MemberDTO login(HashMap<String, String> map) {
		return session.selectOne("MemberMapper.login", map);
	}

	// 이메일 인증을 위한 랜덤번호 저장
	public int updateMailKey(MemberDTO dto) throws Exception {
	    return session.update("MemberMapper.updateMailKey", dto);
	}

	// 메일 인증 후 mail_auto 0 -> 1 변경
	public int updateMailAuth(MemberDTO dto) throws Exception {
	    return session.update("MemberMapper.updateMailAuth", dto);
	}

	// 로그인 시 인증 유무 체크
	public int emailAuthFail(String userID) throws Exception {
	    return session.selectOne("MemberMapper.emailAuthFail", userID);
	}
	
	// 이메일당 가입된 아이디 개수
	public int idPerEmailCount(String email) {
		return session.selectOne("MemberMapper.idPerEmailCount", email);
	}
	
	// 아이디 찾기
	public List<MemberDTO> findId(MemberDTO dto) {
		return session.selectList("MemberMapper.findId", dto);
	}
	
	// 비밀번호 찾기
	public int findPw_email(MemberDTO dto) {
		return session.selectOne("MemberMapper.findPw_email", dto);
	}
	
	// 인증키 일치 확인
	public int checkKey(MemberDTO dto) {
		return session.selectOne("MemberMapper.checkKey", dto);
	}
	
	// 비밀번호 재설정
	public int newPw(MemberDTO dto) {
		return session.update("MemberMapper.newPw", dto);
	}
	
	// 인증키 초기화
	public int resetMailKey(MemberDTO dto) {
		return session.update("MemberMapper.resetMailKey", dto);
	}
	
}
