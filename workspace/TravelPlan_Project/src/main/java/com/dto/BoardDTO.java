package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("BoardDTO")
public class BoardDTO {
	private int contentNum;
	private String userID;
	private String title;
	private String boardDate;
	private int views;
	private String mainText;
	private int likeContent;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int contentNum, String userID, String title, String boardDate, int views, String mainText,
			int likeContent) {
		this.contentNum = contentNum;
		this.userID = userID;
		this.title = title;
		this.boardDate = boardDate;
		this.views = views;
		this.mainText = mainText;
		this.likeContent = likeContent;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getMainText() {
		return mainText;
	}
	public void setMainText(String mainText) {
		this.mainText = mainText;
	}
	public int getLikeContent() {
		return likeContent;
	}
	public void setLikeContent(int likeContent) {
		this.likeContent = likeContent;
	}
}
