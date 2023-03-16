package com.semi.learn.dto;

import java.io.Serializable;
 
public class QnaDto implements Serializable {
	private int seq;
	private int les_seq;		// 부모레슨
	private int ref;			// qna 글번호
	private int step;			// qna 행번호
	private String id;			// 작성자
	private String content;		// 내용
	private String wdate;		// 작성일

	public QnaDto() {
	}

	public QnaDto(int les_seq, String id, String content) {
		super();
		this.les_seq = les_seq;
		this.id = id;
		this.content = content;
	}

	public QnaDto(int seq, int les_seq, int ref, int step, String id, String content, String wdate) {
		super();
		this.seq = seq;
		this.les_seq = les_seq;
		this.ref = ref;
		this.step = step;
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

	public int getLes_seq() {
		return les_seq;
	}

	public void setLes_seq(int les_seq) {
		this.les_seq = les_seq;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
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
		return "QnaDto [seq=" + seq + ", les_seq=" + les_seq + ", ref=" + ref + ", step=" + step + ", id=" + id
				+ ", content=" + content + ", wdate=" + wdate + "]";
	}
	
}
