package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ApiDTO2")
public class ApiDTO2 {
	String mapx;
	String mapy;
	public ApiDTO2() {
		// TODO Auto-generated constructor stub
	}
	public ApiDTO2(String mapx, String mapy) {
		this.mapx = mapx;
		this.mapy = mapy;
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
	@Override
	public String toString() {
		return "ApiDTO2 [mapx=" + mapx + ", mapy=" + mapy + "]";
	}
	
	
}
