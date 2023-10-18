package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CommentDTO")
public class CommentDTO {
	private int commentID;
	private int contentNum;
	private String userID;
	private String commentdate;
	private String comments;
	
	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}
	public CommentDTO(int commentID, int contentNum, String userID, String commentdate, String comments) {
		this.commentID = commentID;
		this.contentNum = contentNum;
		this.userID = userID;
		this.commentdate = commentdate;
		this.comments = comments;
	}
	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public int getContentNum() {
		return contentNum;
	}

	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
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
