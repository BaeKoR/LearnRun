package com.semi.learn.dto;

import java.io.Serializable;

public class ClsParam implements Serializable {
	private String search;
	private String category;
	private int pageNum;
	private int start;
	private int end;
	
	public ClsParam() {
	}

	public ClsParam(String search, String category, int pageNum, int start, int end) {
		super();
		this.search = search;
		this.category = category;
		this.pageNum = pageNum;
		this.start = start;
		this.end = end;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "ClsParam [search=" + search + ", category=" + category + ", pageNum=" + pageNum + ", start=" + start
				+ ", end=" + end + "]";
	}
	
}
