package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class MemberDAO {
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;
	
	
}
