package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository("dao")
public class MemberDAO {
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;
	
	// 회원가입
	public int register(MemberDTO dto) {
		int n = session.insert("MemberMapper.register", dto);
		return n;
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

	
	
}
