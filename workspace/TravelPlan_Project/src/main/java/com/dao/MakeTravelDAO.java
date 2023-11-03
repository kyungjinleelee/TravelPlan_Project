package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.SpotDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

@Repository
public class MakeTravelDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	
	// 데이터 삽입
	public int insertApi(List<SpotDTO> list) {
		System.out.println(list);
		return session.insert("MakeTravelMapper.insertApi", list);
	}
	
	// 중복 데이터 삭제
	public int deleteDuplication(List<SpotDTO> list) {
		return session.delete("MakeTravelMapper.deleteDuplication", list);
	}
	
	// 장소 찾기
	public List<SpotDTO> findSpot(HashMap<String, String> map) {
		return session.selectList("MakeTravelMapper.findSpot", map);
	}
	
	// 지역별 숙박/음식 시설 찾기
	public List<SpotDTO> findHotelandFood(HashMap<String, Object> map) {
		return session.selectList("MakeTravelMapper.findHotelandFood", map);
	}
	
	// 지역별 관광시설 찾기
	public List<SpotDTO> findSightseeing(HashMap<String, Object> map) {
		return session.selectList("MakeTravelMapper.findSightseeing", map);
	}
	
	// 일정만들기(TravelDTO) 저장
	public int saveTravel(TravelListDTO dto) {
		return session.insert("MakeTravelMapper.saveTravel", dto);
	}
	
	// travel 테이블id 조회
	public int selectTravelId(TravelListDTO dto) {
		return session.selectOne("MakeTravelMapper.selectTravelId", dto);
	}
	
	// 여행 계획 제목/날짜 수정 및 저장완료
	public int travelSaveAndUpdate(TravelListDTO dto) {
		return session.update("MakeTravelMapper.travelSaveAndUpdate", dto);
	}
	
	// 상세 일정 저장
	public int saveSchedule(List<PlanDTO> list) {
		return session.insert("MakeTravelMapper.saveSchedule", list);
	}
	
	// 일정 만들기 페이지에서 벗어날 경우 travel 테이블에 저장해놓은 데이터 삭제
	public int deleteTravelData(int travelID) {
		return session.delete("MakeTravelMapper.deleteTravelData", travelID);
	}
}
