package com.service;

import java.util.List;

import com.dto.TravelDTO;

public interface TravelService {
	
	//일정 만들기
	
	//일정보관함
	public List<TravelDTO> travel(String userID);
	
	//일정 상세 보기
	public TravelDTO travelRetrieve(int travelID);
	
	//일정 삭제하기
	public int travelDel(int travelID);
	
}
