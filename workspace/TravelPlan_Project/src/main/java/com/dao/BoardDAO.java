package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
@Repository
public class BoardDAO {
	@Autowired
	SqlSessionTemplate session;    //session 주입받기

	//글 자세히보기
	public BoardDTO findOne(int contentNum) {
		BoardDTO dto = session.selectOne("BoardMapper.findOne",contentNum);
		return dto;
	}

	public List<CommentDTO> selectCommentList(int contentNum) {
		List<CommentDTO> dto = session.selectList("BoardMapper.selectCommentList",contentNum);
		return dto;
	}

	public List<BoardDTO> selectList() {
		List<BoardDTO> dto = session.selectList("BoardMapper.findAll");
		return dto;
	}

	public int update(BoardDTO dto) {
		int n = session.update("BoardMapper.update", dto);
		return n;
	}
}
