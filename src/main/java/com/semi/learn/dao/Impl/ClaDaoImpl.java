package com.semi.learn.dao.Impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.ClaDao;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;

@Repository
public class ClaDaoImpl implements ClaDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Cls.";

	@Override
	public List<Map<String, Object>> getMyReview(ReviewParam param) {
		return session.selectList(ns + "getMyReview", param);
	}

}
