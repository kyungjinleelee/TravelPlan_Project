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
	
	// 로그인
	public MemberDTO login(HashMap<String, String> map) {
		return session.selectOne("MemberMapper.login", map);
	}
}
