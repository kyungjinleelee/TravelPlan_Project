package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ApiDTO2;

@Repository
public class ApiDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	
	// 데이터 삽입
	public int insertApi(List<ApiDTO2> list) {
		System.out.println(list);
		return session.insert("ApiMapper.insertApi", list);
	}
	
}
