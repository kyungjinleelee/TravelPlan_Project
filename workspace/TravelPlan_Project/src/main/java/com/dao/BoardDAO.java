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
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
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

//	public List<BoardDTO> selectList() {//페이징 처리 만들기 이전 사용하던 것.
//		List<BoardDTO> dto = session.selectList("BoardMapper.findAll");
//		return dto;
//	}

	//게시글에 여행 일정 통합 후  추가된 내용.
	//여행
	public TravelListDTO findOneTravel(int travelID) {
		TravelListDTO dto = session.selectOne("BoardMapper.findOne_Travel",travelID);
		return dto;
	}

	public List<PlanDTO>  findAllPlan(int travelID) {
		List<PlanDTO> dto = session.selectList("BoardMapper.findAll_Plan",travelID);
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
	public PageDTO list(int curPage, Map<String, String> map) {
		PageDTO pageDTO = new PageDTO();
		System.out.println(map);
		int offset = (curPage-1)*pageDTO.getPerPage();//이게 옛날거부터 보게 되는건가 이러면
		int limit = pageDTO.getPerPage();
	
		List<BoardDTO> list = session.selectList("BoardMapper.findAll", map, new RowBounds(offset, limit));

		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		
		int totalCount = 0; // 초기화
		if(map.get("searchValue")==null) { 
			// 검색을 안 한 경우 
			totalCount = session.selectOne("BoardMapper.totalCnt");
		}else {
			// 검색을 한 경우 
			totalCount = session.selectOne("BoardMapper.totalCountSearch", map);
		}
//		int totalCount = session.selectOne("BoardMapper.totalCnt");
		pageDTO.setTotalCount(totalCount);
		
		/* searchName과 searchValue를 PageDTO에 저장해야 함 -> 그래야 검색했을 때 페이징이 적용된다.
		searchName과 searchValue 유지를 시켜야 다른 페이지로 이동해도 검색조건이 유지가 된다.*/
		pageDTO.setSearchName(map.get("searchName"));
		pageDTO.setSearchValue(map.get("searchValue"));
		
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
	
	// 베스트 게시글 목록 출력
	public List<BoardDTO> bestList() throws Exception{
		return session.selectList("BoardMapper.bestList");
	}

}
