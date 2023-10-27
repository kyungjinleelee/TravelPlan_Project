package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.CommentDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired //dao
	BoardDAO dao;
	
	@Override
	public BoardDTO findOne(int contentNum) {
		BoardDTO dto = dao.findOne(contentNum);
		return dto;
	}

	@Override
	public List<CommentDTO> selectCommentList(int contentNum) {
		List<CommentDTO> dto = dao.selectCommentList(contentNum);
		return dto;
	}

	@Override
	public List<BoardDTO> selectList() {
		List<BoardDTO>dto =  dao.selectList();
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

	public int delete(int contentNum) {
		dao.delete(contentNum);
		return 0;
	}

}
