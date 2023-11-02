package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ApiDAO;
import com.dto.ApiDTO2;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

@Service
public class ApiServiceImpl implements ApiService {
	
	@Autowired //dao
	ApiDAO dao;
	
	@Override
	@Transactional
	public int insertApi(List<ApiDTO2> list) {
		// 중복 제거
		dao.deleteDuplication(list);
		// 데이터 삽입
		dao.insertApi(list);
		
		return 1;
	}

	// 장소 찾기
	@Override
	public List<ApiDTO2> findSpot(HashMap<String, String> map) {
		return dao.findSpot(map);
	}

	// 지역별 숙박시설 찾기
	@Override
	public List<ApiDTO2> findHotelandFood(HashMap<String, Object> map) {
		return dao.findHotelandFood(map);
	}

	// 지역별 관광시설 찾기
	@Override
	public List<ApiDTO2> findSightseeing(HashMap<String, Object> map) {
		return dao.findSightseeing(map);
	}

	// 일정만들기(TravelDTO) 저장
	@Override
	public int saveTravel(TravelListDTO dto) {
		return dao.saveTravel(dto);
	}

	// Travel 테이블 ID 조회
	@Override
	public int selectTravelId(TravelListDTO dto) {
		return dao.selectTravelId(dto);
	}

	// 여행 계획 제목/날짜 수정 및 저장완료
	@Override
	public int travelSaveAndUpdate(TravelListDTO dto) {
		return dao.travelSaveAndUpdate(dto);
	}

	@Override
	public int saveSchedule(List<PlanDTO> list) {
		return dao.saveSchedule(list);
	}

	@Override
	public int deleteTravelData(int travelID) {
		return dao.deleteTravelData(travelID);
	}

}
