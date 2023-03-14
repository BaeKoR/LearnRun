package com.semi.learn.service;

import java.util.List;
import java.util.Map;

import com.semi.learn.dto.ReviewParam;

public interface ClsService {
	
	List<Map<String, Object>> getMyReview(ReviewParam param);
}
