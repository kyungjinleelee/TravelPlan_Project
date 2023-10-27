package com.service;

import java.util.List;

import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
import com.dto.UserLikeDTO;


public interface BoardService {
	//게시판 조회
	public List<BoardDTO> selectList();
	
	//게시글 상세 조회
	public BoardDTO findOne(int contentNum);
	
	//댓글 조회
	public List<CommentDTO> selectCommentList(int contentNum);
	
	//게시글 수정
	public int update(BoardDTO dto);
	
	//게시글 작성
	public int write(BoardDTO dto);
	
	//삭제
	public int delete(int contentNum);
	
	/*
	//좋아요 목록
	public List<UserLikeDTO> userLikeList(String userid);
	
	//내가 쓴 글 목록
	public List<BoardDTO> writeList(String userid);
	*/
}
