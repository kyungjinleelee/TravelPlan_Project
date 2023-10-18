package com.service;

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

}
