package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.PlanDTO;

@Repository
public class PlanDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	public List<PlanDTO> plan(int travelID) {
		return session.selectList("TravelMapper.planRetrieve", travelID);
	}
	
//	public PlanDTO plan(int travelID) {
//		return session.selectOne("TravelMapper.planRetrieve", travelID);
//	}

}
