package com.semi.learn.dao.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.MemberDao;
import com.semi.learn.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	// MyBatis 접근(생성)
	@Autowired // 자동생성
	SqlSession session;
	
	String ns = "Member.";

	@Override
	public int delMember(MemberDto dto) {
		return session.delete(ns + "delMember", dto);
	}
	
}





























