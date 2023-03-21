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
		return session.insert(ns + "delMember", dto);
	}

	@Override
	public List<ClsDto> clslist(String id) {
		return session.selectList(ns + "clslist", id);
	}

	@Override
	public ClsDto getcls(int seq) {
		return session.selectOne(ns + "getcls", seq);
	}

	@Override
	public MemberDto getmember(String id) {
		return session.selectOne(ns + "getmember", id);
	}

	@Override
	public int updateMemerAf(MemberDto dto) {
		return session.update(ns + "updateMemerAf", dto);
	}
	
	@Override
	public List<ClsDto> getTakingCls(String id) {
		return session.selectList(ns + "getTakingCls", id);
	}

	@Override
	public List<ClsDto> getLikeCls(String id) {
		return session.selectList(ns + "getLikeCls", id);
	}

}
