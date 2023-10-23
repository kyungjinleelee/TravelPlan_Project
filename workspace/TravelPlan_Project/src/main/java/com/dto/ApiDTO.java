package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ApiDTO")
public class ApiDTO {
	String code;
	String name;
	public ApiDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApiDTO(String code, String name) {
		this.code = code;
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ApiDTO [code=" + code + ", name=" + name + "]";
	}
	
	
}
