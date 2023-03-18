package com.semi.learn.dao.Impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.MypageDao;
import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
import com.semi.learn.dto.MemberDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;

@Repository
public class MypageDaoImpl implements MypageDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Mypage.";

	@Override
	public List<Map<String, Object>> getMyReview(String id) {
		return session.selectList(ns + "getMyReview", id);
	}
	
	@Override
	public int delMember(MemberDto dto) {
		return session.delete(ns + "delMember", dto);
	}

	@Override
	public List<ClsDto> clslist(String id) {
		return session.selectList(ns + "clslist", id);
	}

}
