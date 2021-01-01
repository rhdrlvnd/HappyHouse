package com.ssafy.happyhouse.model;

public class UserDto {
	private int userNo;
	private String user_id;
	private String user_password;
	private String user_email;
	private String user_name;
	private String phone;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "UserDto [user_no=" + userNo + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", user_email=" + user_email + ", user_name=" + user_name + ", phone=" + phone + "]";
	}

	
}
