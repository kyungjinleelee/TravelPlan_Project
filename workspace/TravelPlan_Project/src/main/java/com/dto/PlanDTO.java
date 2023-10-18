package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("PlanDTO")
public class PlanDTO {
	private int planID;
	private int travelID;
	private int day_num;
	private String item;
	private String item_add;
	
	public PlanDTO() {
		// TODO Auto-generated constructor stub
	}
	public PlanDTO(int planID, int travelID, int day_num, String item, String item_add) {
		this.planID = planID;
		this.travelID = travelID;
		this.day_num = day_num;
		this.item = item;
		this.item_add = item_add;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
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
}
