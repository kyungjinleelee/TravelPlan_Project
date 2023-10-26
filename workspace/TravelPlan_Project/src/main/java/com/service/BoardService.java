package com.service;

import java.util.List;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;


public interface BoardService {
	//게시판 조회
	public List<BoardDTO> selectList();
	
	//게시글 상세 조회
	public BoardDTO findOne(int contentNum);
	
	
	//댓글 조회
	public List<CommentDTO> selectCommentList(int contentNum);
	
	public int update(BoardDTO dto);
	/*
	//회원 정보 수정
	public void memberUpdate(MemberDTO dto);
	
	//일정보관함
	public List<TravelDTO> travel(String userID);
	
	//좋아요 목록
	public List<UserLikeDTO> userLikeList(String userid);
	
	//내가 쓴 글 목록
	public List<BoardDTO> writeList(String userid);
	*/
}
