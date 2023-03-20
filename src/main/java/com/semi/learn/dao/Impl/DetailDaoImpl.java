package com.semi.learn.dao.Impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.learn.dao.DetailDao;
import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;

@Repository
public class DetailDaoImpl implements DetailDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Detail.";
	
	@Override
	public ClsDto getCls(int seq) {
		return session.selectOne(ns + "getCls", seq);
	}

	@Override
	public List<Map<String, Object>> getReview(ReviewParam param) {
		return session.selectList(ns + "getReview", param);
	}

	@Override
	public int countReview(int cls_seq) {
		return session.selectOne(ns + "countReview", cls_seq);
	}

	@Override
	public int writeReview(ReviewDto dto) {
		return session.insert(ns + "writeReview", dto);
	}

	@Override
	public int updateReview(ReviewDto dto) {
		return session.update(ns + "updateReview", dto);
	}

	@Override
	public int checkTaking(ClsDto dto) {
		return session.selectOne(ns + "checkTaking", dto);
	}

	@Override
	public int checkLiking(ClsDto dto) {
		return session.selectOne(ns + "checkLiking", dto);
	}

	@Override
	public int takeCls(ClsDto dto) {
		return session.insert(ns + "takeCls", dto);
	}

	@Override
	public int likeCls(ClsDto dto) {
		return session.insert(ns + "likeCls", dto);
	}

	@Override
	public int notTakeCls(ClsDto dto) {
		return session.delete(ns + "notTakeCls", dto);
	}

	@Override
	public int notLikeCls(ClsDto dto) {
		return session.delete(ns + "notLikeCls", dto);
	}
	
}
