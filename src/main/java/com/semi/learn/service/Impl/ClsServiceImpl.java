package com.semi.learn.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.ClaDao;
import com.semi.learn.dto.ReviewParam;
import com.semi.learn.service.ClsService;

@Service
public class ClsServiceImpl implements ClsService {
	
	@Autowired
	ClaDao dao;

	@Override
	public List<Map<String, Object>> getMyReview(String id) {
		return dao.getMyReview(id);
	}
	
	

}
