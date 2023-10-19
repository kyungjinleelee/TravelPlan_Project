package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

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
	//dto에 담긴 파라미터들을 MyPageMapper의 아이디가 memberUpdate인 쿼리에 넣어준다.
	public void memberUpdate(MemberDTO dto) {
		session.update("MyPageMapper.memberUpdate", dto);
//		session.selectOne("MyPageMapper.memberUpdate", dto);
	}
	
	//내가 찜 한 글 목록
	public List<UserLikeDTO> userLikeList(String userID) {
		return session.selectList("MyPageMapper.userLikeList", userID);
	}

	//여행계획 (내보관함) 목록
	public List<TravelDTO> writeList(String userID) {
		return session.selectList("MyPageMapper.writeList", userID);
	}
	
}
