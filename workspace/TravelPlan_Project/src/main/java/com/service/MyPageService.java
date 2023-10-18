package com.service;

import java.util.List;


import com.dto.TravelDTO;
import com.dto.UserLikeDTO;


public interface MyPageService {

	public List<UserLikeDTO> userLikeList(String userid);// 내가 찜한 일정
	public List<TravelDTO> writeList(String userid);// 내가 쓴 글 목록
}



