package com.service;

import java.util.HashMap;
import java.util.List;

import com.dto.SharedBoardDTO;
import com.dto.TravelListDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;

public interface SharedBoardService {
	// 자세히보기
	public int retreive(MemberDTO dto);
	public List<SharedBoardDTO> SharedBoard();
	public TravelListDTO findOne(int travelID);
	public List<PlanDTO> selectPlanList(int travelID);
	
}
