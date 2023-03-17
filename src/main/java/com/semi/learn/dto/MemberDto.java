package com.semi.learn.dto;

import java.io.Serializable;

/*create table member(
id varchar(20) primary key,
pwd varchar(50) not null,
name varchar(50) not null,
email varchar(100) not null,
phone varchar(12) not null,
auth int,
filename varchar(50),
newfilename varchar(50) 
);
*/
 
public class MemberDto implements Serializable{
	private String id;			// 아이디
	private String pwd;			// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String phone;		// 전화번호
	private int auth;			// 3:일반회원 0:관리자
	private String filename;	// 파일명
	private String newfilename;
	private int mail_auth;		// 이메일 인증 1이면 인증한 메일
	private String mail_key;	// 인증랜덤키 
	
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
	
	
	

	public MemberDto(String id, String pwd, String name, String email, String phone, int auth, String filename,
			String newfilename, int mail_auth, String mail_key) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
		this.filename = filename;
		this.newfilename = newfilename;
		this.mail_auth = mail_auth;
		this.mail_key = mail_key;
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
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", auth=" + auth + ", filename=" + filename + ", newfilename=" + newfilename + ", mail_auth="
				+ mail_auth + ", mail_key=" + mail_key + "]";
	}

	
	
}