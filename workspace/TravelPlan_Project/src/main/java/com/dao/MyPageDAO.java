package com.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

public class MyPageDAO {
// userLike, travelDTO, 
//planDTO? 내가 좋아요한 목록 user like list,  
	@Autowired
	SqlSessionTemplate session;
	
	// 내가 찜한 일정
	public List<UserLikeDTO> userLikeList(String userid) {
		return session.selectList("MyPageMapper.userLikeList", userid);
	}

	// 내가 쓴 글 목록
	public List<TravelDTO> writeList(String userid) {
		return session.selectList("MyPageMapper.writeList", userid);
	}
}
