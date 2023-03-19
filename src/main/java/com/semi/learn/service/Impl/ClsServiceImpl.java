package com.semi.learn.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.ClsDao;
import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
import com.semi.learn.service.ClsService;

@Service
public class ClsServiceImpl implements ClsService {
	
	@Autowired
	ClsDao dao;

	@Override
	public List<ClsDto> clslist(ClsParam param) {
		return dao.clslist(param);
	}

	@Override
	public List<ClsDto> recClslist(String category) {
		return dao.recClslist(category);
	}

	@Override
	public List<ClsDto> bestClslist() {
		return dao.bestClslist();
	}

	@Override
	public boolean uploadCls(ClsDto dto) {
		int n = dao.uploadCls(dto);
		return n>0?true:false;
	}
	
}
