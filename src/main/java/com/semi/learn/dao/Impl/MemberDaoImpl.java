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
	
	String ns = "Member."; // ns: namespace

	@Override
	public int addMember(MemberDto dto) {
		return session.insert(ns + "addMember", dto);
	}

	@Override
	public int checkId(String id) {
		return session.selectOne(ns +"checkId", id);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return session.selectOne(ns + "login", dto);
	}

	@Override
	public int updateMailKey(MemberDto dto) {
		 return session.update(ns + "updateMailKey", dto);
	}

	@Override
	public int updateMailAuth(MemberDto dto) {
		return session.update(ns + "updateMailAuth", dto);
	}

	@Override
	public int emailAuthFail(String id) {
		return session.selectOne(ns + "emailAuthFail", id);
	}

	@Override
	public MemberDto emailCheck(String email) {
		return session.selectOne(ns + "emailCheck", email);
	}

	@Override
	// 비밀번호 업데이트 
	public int pwdUpdate(MemberDto dto) {
		return session.update(ns + "pwdUpdate", dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		return session.selectOne(ns + "findId", dto);
	}

	@Override
	public MemberDto getMember(MemberDto dto) {
		return session.selectOne(ns + "getMember", dto);
	}
	
}





























