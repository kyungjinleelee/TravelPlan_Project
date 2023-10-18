package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("TCommentDTO")
public class TCommentDTO {
	private int tcommentID;
	private int tcontentID;
	private String userID;
	private String commentdate;
	private String comments;
	
	public TCommentDTO() {
		// TODO Auto-generated constructor stub
	}
	public TCommentDTO(int tcommentID, int tcontentID, String userID, String commentdate, String comments) {
		this.tcommentID = tcommentID;
		this.tcontentID = tcontentID;
		this.userID = userID;
		this.commentdate = commentdate;
		this.comments = comments;
	}
	public int getTcommentID() {
		return tcommentID;
	}

	public void setTcommentID(int tcommentID) {
		this.tcommentID = tcommentID;
	}

	public int getTcontentID() {
		return tcontentID;
	}

	public void setTcontentID(int tcontentID) {
		this.tcontentID = tcontentID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}
