package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SharedBoardDAO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.SharedBoardDTO;
import com.dto.TravelDTO;

@Service
public class SharedBoardServiceImpl implements SharedBoardService {

	@Autowired
	// dao;
	SharedBoardDAO sharedBoardDAO;
	
	@Override
	public int retreive(MemberDTO dto) {
		//=SharedBoardDAO.
		return 0;
	}

	//공유 일정 게시판(목록)
	@Override 
	public List<SharedBoardDTO> SharedBoard() {
		List<SharedBoardDTO> SbDTOList= sharedBoardDAO.selectAll();
		return SbDTOList;
	}

	@Override
	public TravelDTO findOne(int TravelID) {
		TravelDTO dto = sharedBoardDAO.findOne(TravelID);
		return dto;
	}

	@Override
	public List<PlanDTO> selectPlanList(int travelID) {
		List<PlanDTO> dto = sharedBoardDAO.selectPlanList(travelID);
		return dto;
	}

}
