package com.semi.learn.dto;

import java.io.Serializable;

public class LessonDto implements Serializable {
	private int seq;
	private int cls_seq;		// 부모클래스
	private String title;		// 제목
	private String content;		// 내용
	private String filename;	// 파일명
	private String newfilename;

	public LessonDto() {
	}

	public LessonDto(int cls_seq, String title, String content, String filename) {
		super();
		this.cls_seq = cls_seq;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}

	public LessonDto(int seq, int cls_seq, String title, String content, String filename, String newfilename) {
		super();
		this.seq = seq;
		this.cls_seq = cls_seq;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newfilename = newfilename;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		return "LessonDto [seq=" + seq + ", cls_seq=" + cls_seq + ", title=" + title + ", content=" + content
				+ ", filename=" + filename + ", newfilename=" + newfilename + "]";
	}
	
}
