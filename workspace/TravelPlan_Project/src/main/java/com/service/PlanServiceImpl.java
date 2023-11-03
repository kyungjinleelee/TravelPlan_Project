package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PlanDAO;
import com.dto.PlanDTO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanDAO dao;
	
	@Override
	public List<PlanDTO> plan(int travelID) {
		return dao.plan(travelID);
	}

//	@Override
//	public PlanDTO plan(int travelID) {
//		return dao.plan(travelID);
//	}

}
