package com.semi.learn.service;

import java.util.List;

import com.semi.learn.dto.LessonDto;
import com.semi.learn.dto.QnaDto;
import com.semi.learn.dto.QnaParam;

public interface LessonService {
	
	LessonDto getLesson(int les_seq);
	List<LessonDto> getLessonList(int cls_seq);
	String getClsTitle(int cls_seq);
	List<QnaDto> getQnaList(QnaParam param);
	int countQna(int les_seq);
	boolean writeQue(QnaDto dto);
	boolean writeAns(QnaDto dto);
}
