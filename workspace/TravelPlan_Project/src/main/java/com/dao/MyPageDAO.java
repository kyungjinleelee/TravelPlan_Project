package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSessionTemplate session;    //session 주입받기
	
	//수정할 회원 정보 가져오기
	//userID에 해당하는 값들을 다뽑아내서 dto에 담고 반환
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = session.selectOne("MyPageMapper.memberInfo", userID);
		return dto;
	}
	
	//회원정보수정
//	public int memberUpdate(MemberDTO dto) {
//		return session.update();
//	}
	
}
