package com.dto;

import java.util.List;

public class PageDTO2 {
	
	List<TravelListDTO> list;   //목록
	private int perPage = 8;  //페이지당 보여줄 데이터 갯수
	int totalCount;  //전체 레코드 갯수
	int curPage;  //현재 페이지 번호
	
	public List<TravelListDTO> getList() {
		return list;
	}
	public void setList(List<TravelListDTO> list) {
		this.list = list;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

}
