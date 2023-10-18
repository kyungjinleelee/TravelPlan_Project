package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("TravelDTO")
public class TravelDTO {
	private int travelID;
	private String userID;
	private String SDate;
	private String EDate;
	private String travelTitle;
	private int areaCode;
	
	public TravelDTO() {
		// TODO Auto-generated constructor stub
	}
	public TravelDTO(int travelID, String userID, String sDate, String eDate, String travelTitle, int areaCode) {
		this.travelID = travelID;
		this.userID = userID;
		SDate = sDate;
		EDate = eDate;
		this.travelTitle = travelTitle;
		this.areaCode = areaCode;
	}
	public int getTravelID() {
		return travelID;
	}
	public void setTravelID(int travelID) {
		this.travelID = travelID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getSDate() {
		return SDate;
	}
	public void setSDate(String sDate) {
		SDate = sDate;
	}
	public String getEDate() {
		return EDate;
	}
	public void setEDate(String eDate) {
		EDate = eDate;
	}
	public String getTravelTitle() {
		return travelTitle;
	}
	public void setTravelTitle(String travelTitle) {
		this.travelTitle = travelTitle;
	}
	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
}
