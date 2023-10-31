package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ApiDAO;
import com.dto.ApiDTO2;

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

}
