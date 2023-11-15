package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MyPageDAO;
import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.UserLikeDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO dao;     

	//회원 정보 확인
	@Override
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = dao.memberInfo(userID);
		return dto;
	}

	//회원 정보 수정
	@Override
	public void memberUpdate(MemberDTO dto) {      //Controller에서 보내는 파라미터들을 memberUpdate(MemberDTO dto)로 받고
		dao.memberUpdate(dto);    //받은 dto를 DAO로 보냄
	}
	
	//일정보관함
//	@Override
//	public List<TravelDTO> travel(String userID) {
//		List<TravelDTO> list = dao.travel(userID);
//		return list;
//	}
	
	//좋아요 목록
	@Override
	public List<UserLikeDTO> userLikeList(String userID) {
		List<UserLikeDTO> list = dao.userLikeList(userID);
		return list;
	}

	//내가 쓴 글 목록
	@Override
	public List<BoardDTO> writeList(String userID) {
		List<BoardDTO> list = dao.writeList(userID);
		return list;
	}

	//회원 탈퇴하기
	@Transactional
	@Override
	public void memberDelete(MemberDTO dto) {
		dao.deleteTravelRecordsByUserId(dto.getUserID());  //여행일정
		dao.deleteBoardRecordsByUserId(dto.getUserID());   //내가 쓴 글
		dao.deleteCommentsRecordsByUserId(dto.getUserID()); //내가 쓴 댓글
		dao.deleteSharedTravelRecordsByUserId(dto.getUserID()); //공유 여행 게시글
		dao.deleteCommentsOfTravelRecordsByUserId(dto.getUserID()); //공유 여행 게시판 댓글
		dao.deleteUserLikeRecordsByUserId(dto.getUserID()); //좋아요 목록
		dao.memberDelete(dto);  //유저 삭제
	}
	
	//비밀번호 체크
	@Override
	public int checkPw(MemberDTO dto) {
		int result = dao.checkPw(dto);
		return result;
	}

}
