package com.service;

import java.util.List;


import com.dto.TravelDTO;
import com.dto.UserLikeDTO;


public interface MyPageService {

	public List<UserLikeDTO> userLikeList(String userid);// ���� ���� ����
	public List<TravelDTO> writeList(String userid);// ���� �� �� ���
}



