package com.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.PageDTO;
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

	public List<BoardDTO> selectList() {//페이징 처리 만들기 이전 사용하던 것.
		List<BoardDTO> dto = session.selectList("BoardMapper.findAll");
		return dto;
	}

	public int update(BoardDTO dto) {
		int n = session.update("BoardMapper.update", dto);
		return n;
	}

	public int write(BoardDTO dto) {
		int n = session.insert("BoardMapper.write", dto);
		return n;
	}

	public int delete(int contentNum) {
		return session.delete("BoardMapper.delete",contentNum);
		
	}
	
	public int writeComment(CommentDTO dto) {
		int n = session.insert("BoardMapper.writeComment", dto);
		return n;
	}
	
	//페이징 처리
	public PageDTO list(int curPage) {
		PageDTO pageDTO = new PageDTO();
		
		int offset = (curPage-1)*pageDTO.getPerPage();//이게 옛날거부터 보게 되는건가 이러면
		int limit = pageDTO.getPerPage();
	
		List<BoardDTO> list = session.selectList("BoardMapper.findAll", null, new RowBounds(offset, limit));

		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		int totalCount = session.selectOne("BoardMapper.totalCnt");
		pageDTO.setTotalCount(totalCount);

		return pageDTO;
	}
}
