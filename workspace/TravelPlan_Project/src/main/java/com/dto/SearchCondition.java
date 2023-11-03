package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SearchCondition")
public class SearchCondition extends PageDTO {

	private String option;
	private String keyword;
	
	public SearchCondition() {
	}

	public SearchCondition(String option, String keyword) {
		super();
		this.option = option;
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCondition [option=" + option + ", keyword=" + keyword + "]";
	}

	
	
}
