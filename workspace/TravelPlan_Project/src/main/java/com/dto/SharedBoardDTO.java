package com.dto;

import org.apache.ibatis.type.Alias;


@Alias("SharedBoardDTO")

public class SharedBoardDTO {
	private int tContentID;
	private int travelID;
	private String userID;
	private int views;
	private String title;
	
	
	public SharedBoardDTO() {
		super();
	}
	public SharedBoardDTO(int tContentID, int travelID, String userID, int views, String title) {
		super();
		this.tContentID = tContentID;
		this.travelID = travelID;
		this.userID = userID;
		this.views = views;
		this.title = title;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "SharedBoardDTO [tContentID=" + tContentID + ", travelID=" + travelID + ", userID=" + userID + ", views="
				+ views + ", title=" + title + "]";
	}
	
	
	
	
}
