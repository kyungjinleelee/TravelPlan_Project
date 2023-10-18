package com.dao;

<<<<<<< HEAD
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSessionTemplate session;    //session ì£¼ìž…ë°›ê¸°
	
	//ìˆ˜ì •í•  íšŒì› ì •ë³´ ê°€ì ¸ì˜¤ê¸°
	//userIDì— í•´ë‹¹í•˜ëŠ” ê°’ë“¤ì„ ë‹¤ë½‘ì•„ë‚´ì„œ dtoì— ë‹´ê³  ë°˜í™˜
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = session.selectOne("MyPageMapper.memberInfo", userID);
		return dto;
	}
	
	//íšŒì›ì •ë³´ìˆ˜ì •
//	public int memberUpdate(MemberDTO dto) {
//		return session.update();
//	}
	
=======
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.TravelDTO;
import com.dto.UserLikeDTO;

public class MyPageDAO {
// userLike, travelDTO, 
//planDTO? ³»°¡ ÁÁ¾Æ¿äÇÑ ¸ñ·Ï user like list,  
	@Autowired
	SqlSessionTemplate session;
	
	// ³»°¡ ÂòÇÑ ÀÏÁ¤
	public List<UserLikeDTO> userLikeList(String userid) {
		return session.selectList("MyPageMapper.userLikeList", userid);
	}

	// ³»°¡ ¾´ ±Û ¸ñ·Ï
	public List<TravelDTO> writeList(String userid) {
		return session.selectList("MyPageMapper.writeList", userid);
	}
>>>>>>> 719129cae9a7203e96b3062c83fe67922753eb44
}
