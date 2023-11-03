package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("PlanDTO")
public class PlanDTO {
	private int travelID;
	private int day_num;
	private String item;
	private String item_add;
	private String time;
	private float mapx;
	private float mapy;
	
	public PlanDTO() {
	}
	public PlanDTO(int travelID, int day_num, String item, String item_add, String time, float mapx, float mapy) {
		this.travelID = travelID;
		this.day_num = day_num;
		this.item = item;
		this.item_add = item_add;
		this.time = time;
		this.mapx = mapx;
		this.mapy = mapy;
	}
	public int getTravelID() {
		return travelID;
	}
	public void setTravelID(int travelID) {
		this.travelID = travelID;
	}
	public int getDay_num() {
		return day_num;
	}
	public void setDay_num(int day_num) {
		this.day_num = day_num;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getItem_add() {
		return item_add;
	}
	public void setItem_add(String item_add) {
		this.item_add = item_add;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public float getMapx() {
		return mapx;
	}
	public void setMapx(float mapx) {
		this.mapx = mapx;
	}
	public float getMapy() {
		return mapy;
	}
	public void setMapy(float mapy) {
		this.mapy = mapy;
	}
	@Override
	public String toString() {
		return "PlanDTO [travelID=" + travelID + ", day_num=" + day_num + ", item=" + item + ", item_add=" + item_add
				+ ", time=" + time + ", mapx=" + mapx + ", mapy=" + mapy + "]";
	}
	
}
