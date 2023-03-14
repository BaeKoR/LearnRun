package com.semi.learn.dao.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.LessonDao;


@Repository
public class LessonDaoImpl implements LessonDao {

	@Autowired
	SqlSession session;
	
	String ns = "Lesson."; // ns: namespace
}
