package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TravelDAO;
import com.dto.TravelDTO;

@Service
public class TravelServiceImpl implements TravelService {

	@Autowired
	TravelDAO dao;
	
	// 일정 만들기
	
	//일정보관함
	@Override
	public List<TravelDTO> travel(String userID) {
		List<TravelDTO> list = dao.travel(userID);
		return list;
	}
	
	// 일정 상세보기
	@Override
	public TravelDTO travelRetrieve(int travelID) {
		TravelDTO dto = dao.travelRetrieve(travelID);
		return dto;
	}

	// 일정 삭제하기
	@Override
	public int travelDel(int travelID) {
		int n = dao.travelDel(travelID);
		return n;
	}

}
