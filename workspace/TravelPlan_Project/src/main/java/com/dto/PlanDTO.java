package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("PlanDTO")
public class PlanDTO {
	private int travelID;
	private int day_num;
	private String item;
	private String item_add;
	private String time;
	
	public PlanDTO() {
	}
	public PlanDTO(int travelID, int day_num, String item, String item_add, String time) {
		this.travelID = travelID;
		this.day_num = day_num;
		this.item = item;
		this.item_add = item_add;
		this.time = time;
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
	@Override
	public String toString() {
		return "PlanDTO [travelID=" + travelID + ", day_num=" + day_num + ", item=" + item + ", item_add=" + item_add
				+ ", time=" + time + "]";
	}
	
}
