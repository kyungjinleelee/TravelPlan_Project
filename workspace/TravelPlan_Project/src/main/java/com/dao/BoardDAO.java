package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
// 조회수 증가
	public int viewCntUp(int contentNum) {
		return session.update("BoardMapper.viewCntUp", contentNum);
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
	// 좋아요 수 증가
	public int likeCntUp(int contentNum) {
		return session.update("BoardMapper.likeCntUp", contentNum);
	}
	
	//좋아요 리스트에 추가
	public int likeOne(Map map) {
		
		return session.insert("BoardMapper.likeOne", map);
	}
	
	//좋아요 리스트 페이징 처리
	public PageDTO selectUserLikeList(int curPage, String userID){
		PageDTO pageDTO = new PageDTO();
	
		int offset = (curPage-1)*pageDTO.getPerPage();
		int limit = pageDTO.getPerPage();
		
		List<BoardDTO> list = session.selectList("BoardMapper.findAllUserLike", userID, new RowBounds(offset, limit));

		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		int totalCount = session.selectOne("BoardMapper.UserLiketotalCnt",userID);//좋아요 한 게시판의 스큐엘문 넣고 저장할 것.
		pageDTO.setTotalCount(totalCount);
		
		return pageDTO;
	}

	//좋아요 중복 확인
	public int likeDuplicateCheck(String userID, int contentNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userID", userID);
		map.put("contentNum", contentNum);
		return session.selectOne("BoardMapper.likeDuplicateCheck", map);
	}

	 
}
