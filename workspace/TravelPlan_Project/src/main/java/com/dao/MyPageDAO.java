package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSessionTemplate session;    //session 주입받기
	
	//회원 정보 확인
	//userID에 해당하는 값들을 다뽑아내서 dto에 담고 반환
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = session.selectOne("MyPageMapper.memberInfo", userID);
		return dto;
	}
	
	//회원 정보 수정
	//dto에 담긴 파라미터들을 MyPageMapper의 아이디가 memberUpdate인 쿼리에 넣어준다.
	public void memberUpdate(MemberDTO dto) {
		session.update("MyPageMapper.memberUpdate", dto);
	}
	
	//일정보관함
	public List<TravelDTO> travel(String userID) {
		return session.selectList("MyPageMapper.travel", userID);
	}
	
	//내가 찜 한 글 목록
	public List<UserLikeDTO> userLikeList(String userID) {
		return session.selectList("MyPageMapper.userLikeList", userID);
	}

	//여행계획 (내보관함) 목록
	//10 23내가 쓴 글 목록
	public List<BoardDTO> writeList(String userID) {
		return session.selectList("MyPageMapper.writeList", userID);
	}
	
	
}
