package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BoardDAO;
import com.dao.TravelListDAO;
import com.dto.PageDTO2;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

	@Service
	public class TravelListServiceImpl implements TravelListService {

	@Autowired
	TravelListDAO dao;
	
	@Autowired
	BoardDAO boardDao;
	
	//일정보관함
	@Override
	public List<TravelListDTO> travel(String userID) {
		List<TravelListDTO> list = dao.travel(userID);
		return list;
	}
	
	// 페이징 처리
	@Override
	public PageDTO2 list(int curPage, String userID) {
		PageDTO2 dto = dao.list(curPage, userID);
		return dto;
	}
	
	// 일정 상세보기
	@Override
	public TravelListDTO travelRetrieve(int travelID) {
		TravelListDTO dto = dao.travelRetrieve(travelID);
		return dto;
	}
	
	@Override
	public List<PlanDTO> planList(int travelID) {
		List<PlanDTO> list = dao.planList(travelID);
		return list;
	}
	
	// 일정 삭제하기
	@Override
	@Transactional
	public int travelDel(int travelID) {
		List<Integer> contentNumList = dao.getContentNum(travelID);
		if(contentNumList != null) {
			for(int i=0; i<contentNumList.size(); i++) {
				boardDao.delete_like(contentNumList.get(i));
				boardDao.delete_comment(contentNumList.get(i));
				boardDao.delete(contentNumList.get(i));
			}
		}
		int n = dao.travelDel(travelID);
		return n;
	}
	
}
