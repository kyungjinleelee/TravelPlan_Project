package com.dto;

import org.apache.ibatis.type.Alias;

/*shared board title
 *  travel dto write date , TCommentDTO  commentdate 등 
 *  db 에서 date타입인 필드들 데이터형을 date, LocalTimeDate 등으로 바꾸어야 할 수 있음
 *  cf) jackson, @JasonFormat
 *  
 */

@Alias("TravelDTO")
public class TravelListDTO {
	private int travelID;
	private String userID;
	private String SDate;
	private String EDate;
	private String travelTitle;
	private int areaCode;
	private String writedate;
	
	public TravelListDTO() {
		super();
	}
	public TravelListDTO(int travelID, String userID, String sDate, String eDate, String travelTitle, int areaCode,
			String writedate) {
		super();
		this.travelID = travelID;
		this.userID = userID;
		SDate = sDate;
		EDate = eDate;
		this.travelTitle = travelTitle;
		this.areaCode = areaCode;
		this.writedate = writedate;
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
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
	
}
