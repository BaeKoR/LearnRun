package com.semi.learn.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.DetailDao;
import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;
import com.semi.learn.service.DetailService;

@Service
public class DetailServiceImpl implements DetailService {
	
	@Autowired
	DetailDao dao;

	@Override
	public ClsDto getCls(int seq) {
		return dao.getCls(seq);
	}

	@Override
	public List<Map<String, Object>> getReview(ReviewParam param) {
		return dao.getReview(param);
	}

	@Override
	public int countReview(int cls_seq) {
		return dao.countReview(cls_seq);
	}

	@Override
	public boolean writeReview(ReviewDto dto) {
		return dao.writeReview(dto) > 0;
	}

	@Override
	public boolean updateReview(ReviewDto dto) {
		return dao.updateReview(dto) > 0;
	}

	@Override
	public boolean checkTaking(ClsDto dto) {
		return dao.checkTaking(dto) > 0;
	}

	@Override
	public boolean checkLiking(ClsDto dto) {
		return dao.checkLiking(dto) > 0;
	}

	@Override
	public boolean takeCls(ClsDto dto) {
		return dao.takeCls(dto) > 0;
	}

	@Override
	public boolean likeCls(ClsDto dto) {
		return dao.likeCls(dto) > 0;
	}

	@Override
	public boolean notTakeCls(ClsDto dto) {
		return dao.notTakeCls(dto) > 0;
	}

	@Override
	public boolean notLikeCls(ClsDto dto) {
		return dao.notLikeCls(dto) > 0;
	}
	
}
