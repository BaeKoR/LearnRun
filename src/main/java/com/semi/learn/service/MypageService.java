package com.semi.learn.service;

import java.util.List;
import java.util.Map;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
import com.semi.learn.dto.MemberDto;
import com.semi.learn.dto.ReviewParam;

public interface MypageService {
	
	List<Map<String, Object>> getMyReview(String id);
	boolean delMember(MemberDto dto);
	
	List<ClsDto> clslist(String id);
	
	ClsDto getcls(int seq);
	
	MemberDto getmember(String id);
	
	boolean updateMemerAf(MemberDto dto);
}
