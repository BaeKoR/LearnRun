package com.semi.learn.dao;

import java.util.List;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;

public interface ClsDao {
	
	List<ClsDto> clslist(ClsParam param);
	
	List<ClsDto> recClslist(String category);
	
	List<ClsDto> bestClslist();
}
