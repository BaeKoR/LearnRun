package com.semi.learn.dto;

import java.io.Serializable;

public class QnaParam implements Serializable {
	
	private int les_seq;
	private int pageNumber;	// [1][2][3]
	
	private int start;
	private int end;
	
	public QnaParam() {}

	public QnaParam(int les_seq, int pageNumber, int start, int end) {
		super();
		this.les_seq = les_seq;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public int getLes_seq() {
		return les_seq;
	}

	public void setLes_seq(int les_seq) {
		this.les_seq = les_seq;
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
		return "QnaParam [les_seq=" + les_seq + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end
				+ "]";
	}
	
}
