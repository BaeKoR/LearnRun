package com.semi.learn.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.LessonDao;
import com.semi.learn.service.LessonService;

@Service
public class LessonServiceImpl implements LessonService {

	@Autowired
	LessonDao dao;
	
}
