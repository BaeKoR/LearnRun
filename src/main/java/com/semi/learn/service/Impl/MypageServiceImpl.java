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

	@Override
	public ClsDto getcls(int seq) {
		return dao.getcls(seq);
	}

	@Override
	public MemberDto getmember(String id) {
		return dao.getmember(id);
	}

	@Override
	public boolean updateMemerAf(MemberDto dto) {
		int n = dao.updateMemerAf(dto);
		return n>0?true:false;
	}
	
	@Override
	public List<ClsDto> getTakingCls(String id) {
		return dao.getTakingCls(id);
	}

	@Override
	public List<ClsDto> getLikeCls(String id) {
		return dao.getLikeCls(id);
	}
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

}
