package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.PageDTO;

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
	public PageDTO selectList(int curPage) {
		PageDTO dto =  dao.list(curPage);
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
	@Transactional
	public int likeOne(int contentNum) {
		dao.likeOne(contentNum);
		//dao.likeCntUp()
		
		return 0;
	}

}
