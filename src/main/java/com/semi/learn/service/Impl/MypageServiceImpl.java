package com.semi.learn.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.MypageDao;
import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
import com.semi.learn.dto.MemberDto;
import com.semi.learn.dto.ReviewParam;
import com.semi.learn.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDao dao;

	@Override
	public List<Map<String, Object>> getMyReview(String id) {
		return dao.getMyReview(id);
	}
	
	@Override
	public boolean delMember(MemberDto dto) {
		return dao.delMember(dto) > 0;
	}

	@Override
	public List<ClsDto> clslist(String id) {
		return dao.clslist(id);
	}

}
