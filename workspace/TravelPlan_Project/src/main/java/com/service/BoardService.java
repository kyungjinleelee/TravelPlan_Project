package com.service;

import java.util.List;
import java.util.Map;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
import com.dto.UserLikeDTO;


public interface BoardService {
	//게시판 조회
	public PageDTO selectList(Map<String, String> map, int curPage);
	
	//게시글 상세 조회
	public BoardDTO findOne(int contentNum);
	
	//댓글 조회
	public List<CommentDTO> selectCommentList(int contentNum);
	
	//여행 계획 조회, 여행계획 제목 가져오기
	public TravelListDTO findOneTravel(int travelID);
	
	//여행 세부 일정 조회
	public List<PlanDTO> findAllPlan(int travelID);
	
	//게시글 수정
	public int update(BoardDTO dto);
	
	//게시글 작성
	public int write(BoardDTO dto);
	
	//삭제
	public int delete(int contentNum);
	
	//댓글 작성
	public int insertComment(CommentDTO dto );
	
	//좋아요 처리
	public int likeOne(int contentNum, String userID);

	//좋아요 목록 처리
	public PageDTO selectUserLikeList(int curPage, String userID);
	
	//좋아요 중복 체크
	public int likeDuplicateCheck(String userID, int contentNum);
	
	//좋아요 한 글 저장
	/*
	//좋아요 목록
	public List<UserLikeDTO> userLikeList(String userid);
	
	//내가 쓴 글 목록
	public List<BoardDTO> writeList(String userid);
	*/
	
	// 베스트 게시글
	public List<BoardDTO> bestList() throws Exception;
	
}
