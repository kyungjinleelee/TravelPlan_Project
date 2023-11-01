package com.service;

import java.util.HashMap;
import java.util.List;

import com.dto.ApiDTO2;
import com.dto.TravelListDTO;

public interface ApiService {
	public int insertApi(List<ApiDTO2> list);
	
	// 장소 찾기
	public List<ApiDTO2> findSpot(HashMap<String, String> map);
	
	// 지역별 숙박시설 찾기
	public List<ApiDTO2> findHotelandFood(HashMap<String, Object> map);

	// 지역별 관광시설 찾기
	public List<ApiDTO2> findSightseeing(HashMap<String, Object> map);
	
	// 일정만들기(TravelDTO) 저장
	public int saveTravel(TravelListDTO dto);
}
