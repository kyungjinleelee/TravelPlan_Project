package com.service;

import java.util.HashMap;
import java.util.List;

import com.dto.ApiDTO2;

public interface ApiService {
	public int insertApi(List<ApiDTO2> list);
	
	// 장소 찾기
	public List<ApiDTO2> findSpot(HashMap<String, String> map);
}
