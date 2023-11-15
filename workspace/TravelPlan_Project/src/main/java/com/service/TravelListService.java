package com.service;

import java.util.List;

import com.dto.PageDTO2;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

public interface TravelListService {
	
	//일정보관함
	public List<TravelListDTO> travel(String userID);
	
	//페이징 처리
	public PageDTO2 list(int curPage, String userID);
	
	//일정 상세 보기
	public TravelListDTO travelRetrieve(int travelID);
	public List<PlanDTO> planList(int travelID);
	
	//일정 삭제하기
	public int travelDel(int travelID);
}
