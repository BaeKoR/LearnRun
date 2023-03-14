package com.semi.learn.dao;

import java.util.List;
import java.util.Map;

import com.semi.learn.dto.ReviewParam;

public interface ClaDao {
	
	List<Map<String, Object>> getMyReview(ReviewParam param);
}
