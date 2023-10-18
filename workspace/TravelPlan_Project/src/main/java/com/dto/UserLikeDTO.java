package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("UserLikeDTO")
public class UserLikeDTO {
	private int like_list_ID;
	private String userID;
	private int tContentID;
	
	public UserLikeDTO() {
		// TODO Auto-generated constructor stub
	}
	public UserLikeDTO(int like_list_ID, String userID, int tContentID) {
		this.like_list_ID = like_list_ID;
		this.userID = userID;
		this.tContentID = tContentID;
	}
	public int getLike_list_ID() {
		return like_list_ID;
	}
	public void setLike_list_ID(int like_list_ID) {
		this.like_list_ID = like_list_ID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int gettContentID() {
		return tContentID;
	}
	public void settContentID(int tContentID) {
		this.tContentID = tContentID;
	}
}
