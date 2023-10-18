package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SharedBoardDTO")
public class SharedBoardDTO {

	private int tContentID;
	private int travelID;
	private String userID;
	private int views;
	
	public SharedBoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public SharedBoardDTO(int tContentID, int travelID, String userID, int views) {
		this.tContentID = tContentID;
		this.travelID = travelID;
		this.userID = userID;
		this.views = views;
	}

	public int gettContentID() {
		return tContentID;
	}

	public void settContentID(int tContentID) {
		this.tContentID = tContentID;
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

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
}
