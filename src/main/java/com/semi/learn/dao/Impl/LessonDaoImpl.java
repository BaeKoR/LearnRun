package com.semi.learn.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.LessonDao;
import com.semi.learn.dto.LessonDto;
import com.semi.learn.dto.QnaDto;
import com.semi.learn.dto.QnaParam;


@Repository
public class LessonDaoImpl implements LessonDao {

	@Autowired
	SqlSession session;
	
	String ns = "Lesson."; // ns: namespace
	
	@Override
	public LessonDto getLesson(int les_seq) {
		return session.selectOne(ns + "getLesson", les_seq);
	}

	@Override
	public List<LessonDto> getLessonList(int cls_seq) {
		return session.selectList(ns + "getLessonList", cls_seq);
	}

	@Override
	public String getClsTitle(int cls_seq) {
		return session.selectOne(ns + "getClsTitle", cls_seq);
	}

	@Override
	public List<QnaDto> getQnaList(QnaParam param) {
		return session.selectList(ns + "getQnaList", param);
	}

	@Override
	public int countQna(int les_seq) {
		return session.selectOne(ns + "countQna", les_seq);
	}

	@Override
	public int writeQue(QnaDto dto) {
		return session.insert(ns + "writeQue", dto);
	}

	@Override
	public int writeAns(QnaDto dto) {
		return session.insert(ns + "writeAns", dto);
	}

	@Override
	public int writeLesson(LessonDto dto) {
		return session.insert(ns + "writeLesson", dto);
	}

}
