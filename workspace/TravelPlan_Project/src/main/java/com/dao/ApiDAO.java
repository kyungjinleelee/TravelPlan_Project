package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ApiDTO2;
import com.dto.TravelListDTO;

@Repository
public class ApiDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	
	// 데이터 삽입
	public int insertApi(List<ApiDTO2> list) {
		System.out.println(list);
		return session.insert("ApiMapper.insertApi", list);
	}
	
	// 중복 데이터 삭제
	public int deleteDuplication(List<ApiDTO2> list) {
		return session.delete("ApiMapper.deleteDuplication", list);
	}
	
	// 장소 찾기
	public List<ApiDTO2> findSpot(HashMap<String, String> map) {
		return session.selectList("ApiMapper.findSpot", map);
	}
	
	// 지역별 숙박/음식 시설 찾기
	public List<ApiDTO2> findHotelandFood(HashMap<String, Object> map) {
		return session.selectList("ApiMapper.findHotelandFood", map);
	}
	
	// 지역별 관광시설 찾기
	public List<ApiDTO2> findSightseeing(HashMap<String, Object> map) {
		return session.selectList("ApiMapper.findSightseeing", map);
	}
	
	// 일정만들기(TravelDTO) 저장
	public int saveTravel(TravelListDTO dto) {
		return session.insert("ApiMapper.saveTravel", dto);
	}
}
