package com.dao;

<<<<<<< HEAD
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSessionTemplate session;    //session 주입받기
	
	//수정할 회원 정보 가져오기
	//userID에 해당하는 값들을 다뽑아내서 dto에 담고 반환
	public MemberDTO memberInfo(String userID) {
		MemberDTO dto = session.selectOne("MyPageMapper.memberInfo", userID);
		return dto;
	}
	
	//회원정보수정
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
>>>>>>> 719129cae9a7203e96b3062c83fe67922753eb44
}
