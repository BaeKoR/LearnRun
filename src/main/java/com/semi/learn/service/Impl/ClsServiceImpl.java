package com.semi.learn.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.ClsDao;
import com.semi.learn.service.ClsService;

@Service
public class ClsServiceImpl implements ClsService {
	
	@Autowired
	ClsDao dao;
	
}
