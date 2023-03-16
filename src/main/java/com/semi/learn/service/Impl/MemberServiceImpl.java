package com.semi.learn.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.MemberDao;
import com.semi.learn.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	// Dao 접근(생성)
	@Autowired
	MemberDao dao;
}





























