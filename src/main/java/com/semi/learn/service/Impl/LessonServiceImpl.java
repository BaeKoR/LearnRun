package com.semi.learn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.LessonDao;
import com.semi.learn.dto.LessonDto;
import com.semi.learn.dto.QnaDto;
import com.semi.learn.dto.QnaParam;
import com.semi.learn.service.LessonService;

@Service
public class LessonServiceImpl implements LessonService {

	@Autowired
	LessonDao dao;

	@Override
	public LessonDto getLesson(int les_seq) {
		return dao.getLesson(les_seq);
	}
	
	@Override
	public List<LessonDto> getLessonList(int cls_seq) {
		return dao.getLessonList(cls_seq);
	}

	@Override
	public String getClsTitle(int cls_seq) {
		return dao.getClsTitle(cls_seq);
	}

	@Override
	public List<QnaDto> getQnaList(QnaParam param) {
		return dao.getQnaList(param);
	}

	@Override
	public int countQna(int les_seq) {
		return dao.countQna(les_seq);
	}

	@Override
	public boolean writeQue(QnaDto dto) {
		return dao.writeQue(dto) > 0;
	}

	@Override
	public boolean writeAns(QnaDto dto) {
		return dao.writeAns(dto) > 0;
	}
}
