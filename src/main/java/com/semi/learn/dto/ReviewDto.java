package com.semi.learn.dto;

import java.io.Serializable;

public class ReviewDto implements Serializable {
	private int seq;
	private int cls_seq;		// 부모클래스
	private String id;			// 작성자
	private String content;		// 내용
	private String wdate;		// 작성일

	public ReviewDto() {
	}

	public ReviewDto(int cls_seq, String id, String content) {
		super();
		this.cls_seq = cls_seq;
		this.id = id;
		this.content = content;
	}

	public ReviewDto(int seq, int cls_seq, String id, String content, String wdate) {
		super();
		this.seq = seq;
		this.cls_seq = cls_seq;
		this.id = id;
		this.content = content;
		this.wdate = wdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getCls_seq() {
		return cls_seq;
	}

	public void setCls_seq(int cls_seq) {
		this.cls_seq = cls_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", cls_seq=" + cls_seq + ", id=" + id + ", content=" + content + ", wdate="
				+ wdate + "]";
	}
	
}
