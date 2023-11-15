package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.SharedBoardDTO;
import com.dto.TravelListDTO;

@Repository
public class SharedBoardDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	// id 중복체크
	public MemberDTO idCheck(String userID) {
		MemberDTO dto = session.selectOne("MemberMapper.idCheck", userID);
		return dto;
	}
	
	// 로그인
	public MemberDTO login(HashMap<String, String> map) {
		return session.selectOne("MemberMapper.login", map);
	}

	
	public MemberDTO retrieve(HashMap<String, String> map) {
		return session.selectOne("MemberMapper.login", map);
	}
	
	//공유 일정 목록
	public List<SharedBoardDTO> selectAll(){
		return session.selectList("SharedBoardMapper.selectAll");
	}

	////(공유) 일정 자세히보기
	public TravelListDTO findOne(int travelID) {
		return session.selectOne("SharedBoardMapper.findOne", travelID);
	}
	//(공유) 일정 자세히보기 - 여행일정들 보기.
	public List<PlanDTO> selectPlanList(int travelID) {
		return session.selectList("SharedBoardMapper.selectPlanList", travelID);
	}
	
}
