package com.semi.learn.service;

import java.util.List;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;

public interface ClsService {

	List<ClsDto> clslist(ClsParam param);
	
	List<ClsDto> recClslist(String category);
	
	List<ClsDto> bestClslist();
	
	boolean uploadCls(ClsDto dto);
}
