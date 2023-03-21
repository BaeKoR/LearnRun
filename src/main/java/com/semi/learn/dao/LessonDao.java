package com.semi.learn.dao;

import java.util.List;

import com.semi.learn.dto.LessonDto;
import com.semi.learn.dto.QnaDto;
import com.semi.learn.dto.QnaParam;

public interface LessonDao {
	
	LessonDto getLesson(int les_seq);
	List<LessonDto> getLessonList(int cls_seq);
	String getClsTitle(int cls_seq);
	List<QnaDto> getQnaList(QnaParam param);
	int countQna(int les_seq);
	int writeQue(QnaDto dto);
	int writeAns(QnaDto dto);
	
	int writeLesson(LessonDto dto);
}
