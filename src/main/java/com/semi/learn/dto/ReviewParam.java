package com.semi.learn.dto;

import java.io.Serializable;

public class ReviewParam implements Serializable {
	
	private int cls_seq;
	private int pageNumber;	// [1][2][3]
	
	private int start;
	private int end;
	
	public ReviewParam() {}

	public ReviewParam(int cls_seq, int pageNumber, int start, int end) {
		super();
		this.cls_seq = cls_seq;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public int getcls_seq() {
		return cls_seq;
	}

	public void setcls_seq(int cls_seq) {
		this.cls_seq = cls_seq;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
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
		return "ReviewParam [cls_seq=" + cls_seq + ", pageNumber=" + pageNumber + ", start=" + start + ", end="
				+ end + "]";
	}
	
}
