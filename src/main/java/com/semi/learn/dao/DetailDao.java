package com.semi.learn.dao;

import java.util.List;
import java.util.Map;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;

public interface DetailDao {
	
	ClsDto getCls(int seq);
	
	List<Map<String, Object>> getReview(ReviewParam param);
	int countReview(int cls_seq);
	int writeReview(ReviewDto dto);
	int updateReview(ReviewDto dto);
	
	int checkTaking(ClsDto dto);
	int checkLiking(ClsDto dto);
	
	int takeCls(ClsDto dto);
	int likeCls(ClsDto dto);
	int notTakeCls(ClsDto dto);
	int notLikeCls(ClsDto dto);
}
