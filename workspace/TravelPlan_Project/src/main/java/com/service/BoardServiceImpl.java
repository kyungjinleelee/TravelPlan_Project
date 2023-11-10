package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.PageDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired //dao
	BoardDAO dao;
	
	@Override //글 자세히보기
	@Transactional
	public BoardDTO findOne(int contentNum) {
		BoardDTO dto = dao.findOne(contentNum);
		int n = dao.viewCntUp(contentNum);
		return dto;
	}

	@Override
	public List<CommentDTO> selectCommentList(int contentNum) {
		List<CommentDTO> dto = dao.selectCommentList(contentNum);
		return dto;
	}

	@Override
	public PageDTO selectList(Map<String, String> map,int curPage) {
		PageDTO dto =  dao.list(curPage, map);
		return dto;
	}
	@Override
	public int update(BoardDTO dto) {
		return dao.update(dto);
	}
	
	@Override
	public int write(BoardDTO dto) {
		
		return dao.write(dto);
	}
	@Override
	public int delete(int contentNum) {
		dao.delete(contentNum);
		return 0;
	}

	@Override
	public int insertComment(CommentDTO dto) {
		
		return dao.writeComment(dto);
	}

	@Override //좋아요 처리
	@Transactional //서비스 까지는 int string dao 에서는 map이 패러미터임. 헷갈릴 수 있음
	public int likeOne(int contentNum, String userID) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Num", contentNum); //가져온 데이터에 키와 벨류값을 지정
		map.put("Id", userID);
		System.out.println("다오에서 처리된 값");
		System.out.println(map.get("Num"));
		System.out.println(map.get("userID"));
		dao.likeOne(map);
		return dao.likeCntUp(contentNum);
	}

	@Override   //좋아요 목록 처리
	public PageDTO selectUserLikeList(int curPage, String userID) {
		return dao.selectUserLikeList(curPage, userID);
	}

	//좋아요 중복 확인
	@Override
	public int likeDuplicateCheck(String userID, int contentNum) {
		
		return dao.likeDuplicateCheck(userID,contentNum);
	}

	// 베스트 게시글 
	@Override
	public List<BoardDTO> bestList() throws Exception {
		return dao.bestList();
	}


	
	//여행 계획 중에서 제목 등 가져오기.
	@Override
	public TravelListDTO findOneTravel(int travelID) {
		return dao.findOneTravel(travelID);
	}
	//세부 계획들 가져오기
	@Override
	public List<PlanDTO> findAllPlan(int travelID) {
		return dao.findAllPlan(travelID);
	}

	
	
}
