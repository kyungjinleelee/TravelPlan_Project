package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {

	private String userID;
	private String passwd;
	private String name;
	private String email;
	private String post;
	private String addr1;
	private String addr2;
	private String phone;
	private int mail_auth;
	private String mail_key;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String userID, String passwd, String name, String email, String post, String addr1, String addr2,
			String phone, int mail_auth, String mail_key) {
		super();
		this.userID = userID;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.mail_auth = mail_auth;
		this.mail_key = mail_key;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getMail_auth() {
		return mail_auth;
	}

	public void setMail_auth(int mail_auth) {
		this.mail_auth = mail_auth;
	}

	public String getMail_key() {
		return mail_key;
	}

	public void setMail_key(String mail_key) {
		this.mail_key = mail_key;
	}

	@Override
	public String toString() {
		return "MemberDTO [userID=" + userID + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", post="
				+ post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone + ", mail_auth=" + mail_auth
				+ ", mail_key=" + mail_key + "]";
	}
	
}
