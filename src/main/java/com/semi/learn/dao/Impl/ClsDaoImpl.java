package com.semi.learn.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.ClsDao;
import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;


@Repository
public class ClsDaoImpl implements ClsDao {

	@Autowired
	SqlSession session;
	
	String ns = "Cls."; // ns: namespace

	@Override
	public List<ClsDto> clslist(ClsParam param) {
		return session.selectList(ns + "clslist", param);
	}

	@Override
	public List<ClsDto> recClslist(String category) {
		return session.selectList(ns + "recClslist", category);
	}

	@Override
	public List<ClsDto> bestClslist() {
		return session.selectList(ns + "bestClslist");
	}
}
