package com.semi.learn.service;

import java.util.List;
import java.util.Map;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;

public interface DetailService {
	
	ClsDto getCls(int seq);
	List<Map<String, Object>> getReview(ReviewParam param);
	int countReview(int cls_seq);
	boolean writeReview(ReviewDto dto);
	boolean updateReview(ReviewDto dto);
	
	boolean checkTaking(ClsDto dto);
	boolean checkLiking(ClsDto dto);
	
	boolean takeCls(ClsDto dto);
	boolean likeCls(ClsDto dto);
	boolean notTakeCls(ClsDto dto);
	boolean notLikeCls(ClsDto dto);
}
