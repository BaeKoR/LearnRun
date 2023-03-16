package com.semi.learn.dto;

import java.io.Serializable;
 
public class MemberDto implements Serializable{
	private String id;			// 아이디
	private String pwd;			// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String phone;		// 전화번호
	private int auth;			// 3:일반회원 0:관리자
	private String filename;	// 파일명
	private String newfilename;
	
	public MemberDto() {
	}

	public MemberDto(String id, String pwd, String name, String email, String phone) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public MemberDto(String id, String pwd, String name, String email, String phone, String filename) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.filename = filename;
	}

	public MemberDto(String id, String pwd, String name, String email, String phone, int auth, String filename,
			String newfilename) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
		this.filename = filename;
		this.newfilename = newfilename;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", auth=" + auth + ", filename=" + filename + ", newfilename=" + newfilename + "]";
	}
	
}
