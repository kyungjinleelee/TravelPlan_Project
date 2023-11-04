package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MakeTravelDAO;
import com.dto.SpotDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

@Service
public class MakeTravelServiceImpl implements MakeTravelService {
	
	@Autowired //dao
	MakeTravelDAO dao;
	
	@Override
	@Transactional
	public int insertApi(List<SpotDTO> list) {
		// 중복 제거
		dao.deleteDuplication(list);
		// 데이터 삽입
		dao.insertApi(list);
		
		return 1;
	}

	// 장소 찾기
	@Override
	public List<SpotDTO> findSpot(HashMap<String, String> map) {
		return dao.findSpot(map);
	}

	// 지역별 숙박시설 찾기
	@Override
	public List<SpotDTO> findHotelandFood(HashMap<String, Object> map) {
		return dao.findHotelandFood(map);
	}

	// 지역별 관광시설 찾기
	@Override
	public List<SpotDTO> findSightseeing(HashMap<String, Object> map) {
		return dao.findSightseeing(map);
	}

	// 일정만들기(TravelDTO) 저장
	@Override
	public int saveTravel(TravelListDTO dto) {
		return dao.saveTravel(dto);
	}

	// Travel 테이블 ID 조회
	@Override
	public List<Integer> selectTravelId(TravelListDTO dto) {
		return dao.selectTravelId(dto);
	}

	// 여행 계획 제목/날짜 수정 및 저장완료
	@Override
	public int travelSaveAndUpdate(TravelListDTO dto) {
		return dao.travelSaveAndUpdate(dto);
	}
	
	// 상세 일정 저장
	@Override
	public int saveSchedule(List<PlanDTO> list) {
		return dao.saveSchedule(list);
	}

	// 일정 만들기 페이지에서 벗어날 경우 travel 테이블에 저장해놓은 데이터 삭제
	@Override
	public int deleteTravelData(String userID) {
		return dao.deleteTravelData(userID);
	}

}
