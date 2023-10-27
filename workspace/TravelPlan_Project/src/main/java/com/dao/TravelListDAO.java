package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.TravelListDTO;

@Repository
public class TravelListDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	
	// 일정 만들기
	
	//일정보관함
	public List<TravelListDTO> travel(String userID) {
		return session.selectList("TravelMapper.travel", userID);
	}
	
	// 일정 상세보기
	public TravelListDTO travelRetrieve(int travelID) {
		return session.selectOne("TravelMapper.travelRetrieve", travelID);
	}
	
	// 일정 삭제하기
	public int travelDel(int travelID) {
		return session.delete("TravelMapper.travelDel", travelID);
	}
	
}
