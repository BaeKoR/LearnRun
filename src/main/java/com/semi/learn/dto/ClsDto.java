package com.semi.learn.dto;

import java.io.Serializable;

public class ClsDto implements Serializable {
	private int seq;
	private String id;			// 작성자 
	private String category;	// 카테고리
	private String title;		// 제목
	private String content;		// 내용
	private String wdate;		// 작성일
	private int recommend;		// 추천여부
	private String filename;	// 업로드파일명
	private String newfilename;	// 저장된파일명

	public ClsDto() {
	}

	public ClsDto(String id, String category, String title, String content, String filename) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}

	public ClsDto(int seq, String id, String category, String title, String content, String wdate, int recommend,
			String filename, String newfilename) {
		super();
		this.seq = seq;
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.recommend = recommend;
		this.filename = filename;
		this.newfilename = newfilename;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
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
		return "ClsDto [seq=" + seq + ", id=" + id + ", category=" + category + ", title=" + title + ", content="
				+ content + ", wdate=" + wdate + ", recommend=" + recommend + ", filename=" + filename
				+ ", newfilename=" + newfilename + "]";
	}
	
}
