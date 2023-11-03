package com.service;

import java.util.HashMap;
import java.util.List;

import com.dto.SpotDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

public interface MakeTravelService {
	public int insertApi(List<SpotDTO> list);
	
	// 장소 찾기
	public List<SpotDTO> findSpot(HashMap<String, String> map);
	
	// 지역별 숙박시설 찾기
	public List<SpotDTO> findHotelandFood(HashMap<String, Object> map);

	// 지역별 관광시설 찾기
	public List<SpotDTO> findSightseeing(HashMap<String, Object> map);
	
	// 일정만들기(TravelDTO) 저장
	public int saveTravel(TravelListDTO dto);
	
	// Travel 테이블 ID 조회
	public int selectTravelId(TravelListDTO dto);
	
	// 여행 계획 제목/날짜 수정 및 저장완료
	public int travelSaveAndUpdate(TravelListDTO dto);
	
	// 상세 일정 저장
	public int saveSchedule(List<PlanDTO> list);
	
	// 일정 만들기 페이지에서 벗어날 경우 travel 테이블에 저장해놓은 데이터 삭제
	public int deleteTravelData(int travelID);
}
