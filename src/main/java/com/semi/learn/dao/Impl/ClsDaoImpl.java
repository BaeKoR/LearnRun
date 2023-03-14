package com.semi.learn.dao.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.ClsDao;


@Repository
public class ClsDaoImpl implements ClsDao {

	@Autowired
	SqlSession session;
	
	String ns = "Cls."; // ns: namespace
}
