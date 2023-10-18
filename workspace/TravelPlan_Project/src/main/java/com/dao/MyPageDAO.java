package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

public class MyPageDAO {
// userLike, travelDTO, 
//planDTO? ���� ���ƿ��� ��� user like list,  
	@Autowired
	SqlSessionTemplate session;
	
	// ���� ���� ����
	public List<UserLikeDTO> userLikeList(String userid) {
		return session.selectList("MyPageMapper.userLikeList", userid);
	}

	// ���� �� �� ���
	public List<TravelDTO> writeList(String userid) {
		return session.selectList("MyPageMapper.writeList", userid);
	}
}
