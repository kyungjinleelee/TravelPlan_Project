package com.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MyPageDAO;
import com.dto.MemberDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO dao;         //DAO 주입받기

	//수정할 회원 정보 가져오기
	@Override
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = dao.memberInfo(userID);
		return dto;
	}

//	@Override
//	public MemberDTO memberUpdate(String userID) {
//		// TODO Auto-generated method stub
//		return null;
//	}
=======
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.MyPageDAO;
import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

public class MyPageServiceImpl implements MyPageService {
	@Autowired
	MyPageDAO dao;
	

	@Override
	public List<UserLikeDTO> userLikeList(String userid) {
		List<UserLikeDTO> list = dao.userLikeList(userid);
		return list;
	}

	@Override
	public List<TravelDTO> writeList(String userid) {
		List<TravelDTO> list = dao.writeList(userid);
		return list;
	}
>>>>>>> 719129cae9a7203e96b3062c83fe67922753eb44

}
