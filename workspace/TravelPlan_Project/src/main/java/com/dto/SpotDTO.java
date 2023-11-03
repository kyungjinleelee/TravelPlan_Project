package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SpotDTO")
public class SpotDTO {
	String title;
	String addr1;
	String addr2;
	String mapx;
	String mapy;
	String areaCode;
	String contentTypeid;
	
	public SpotDTO(String title, String addr1, String addr2, String mapx, String mapy, String areaCode,
			String contentTypeid) {
		this.title = title;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.mapx = mapx;
		this.mapy = mapy;
		this.areaCode = areaCode;
		this.contentTypeid = contentTypeid;
	}


	public SpotDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}


	public String getMapx() {
		return mapx;
	}


	public void setMapx(String mapx) {
		this.mapx = mapx;
	}


	public String getMapy() {
		return mapy;
	}


	public void setMapy(String mapy) {
		this.mapy = mapy;
	}


	public String getAreaCode() {
		return areaCode;
	}


	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}


	public String getContentTypeid() {
		return contentTypeid;
	}


	public void setContentTypeid(String contentTypeid) {
		this.contentTypeid = contentTypeid;
	}


	


	@Override
	public String toString() {
		return "ApiDTO [title=" + title + ", addr1=" + addr1 + ", addr2=" + addr2 + ", mapx=" + mapx + ", mapy=" + mapy
				+ ", areaCode=" + areaCode + ", contentTypeid=" + contentTypeid + "]";
	}
	
	
}
