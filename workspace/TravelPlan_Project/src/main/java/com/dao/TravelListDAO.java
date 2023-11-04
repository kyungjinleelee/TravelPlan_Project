package com.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.PageDTO2;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;

@Repository
public class TravelListDAO {
	
	@Autowired // SqlSessionTemplate 주입
	SqlSessionTemplate session;

	// 일정보관함
	public List<TravelListDTO> travel(String userID) {
		return session.selectList("TravelMapper.travel", userID);
	}
	
	// 페이징 처리
	public PageDTO2 list(int curPage, String userID) {
		PageDTO2 pageDTO2 = new PageDTO2();
		
		int offset = (curPage-1)*pageDTO2.getPerPage();  //시작위치 = (현재페이지-1) * 페이지 당 보여줄 행 갯수
		int limit = pageDTO2.getPerPage();  //테이블에서 얻을 갯수
		List<TravelListDTO> list = session.selectList("TravelMapper.travel", userID, new RowBounds(offset, limit));
		
		pageDTO2.setList(list);
		pageDTO2.setCurPage(curPage);  //현재 페이지 번호 저장
		
		int totalCount = session.selectOne("TravelMapper.totalCount", userID);  //사용자 별 전체 레코드 갯수
		pageDTO2.setTotalCount(totalCount);  //전체 레코드 갯수 저장
		
		return pageDTO2;
	}
	
	// 일정 상세보기
	public TravelListDTO travelRetrieve(int travelID) {
		return session.selectOne("TravelMapper.travelRetrieve", travelID);
	}
	
	public List<PlanDTO> planList(int travelID) {
		return session.selectList("TravelMapper.planRetrieve", travelID);
	}
	
	// 일정 삭제하기
	public int travelDel(int travelID) {
		return session.delete("TravelMapper.travelDel", travelID);
	}
	
}
