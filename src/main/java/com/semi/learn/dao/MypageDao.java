package com.semi.learn.dao;

import java.util.List;
import java.util.Map;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
import com.semi.learn.dto.MemberDto;
import com.semi.learn.dto.ReviewParam;

public interface MypageDao {
	
	List<Map<String, Object>> getMyReview(String id);
	int delMember(MemberDto dto);
	
	List<ClsDto> clslist(String id);
}
