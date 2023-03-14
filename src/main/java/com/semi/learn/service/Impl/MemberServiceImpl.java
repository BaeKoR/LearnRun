package com.semi.learn.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.MemberDao;
import com.semi.learn.dto.MemberDto;
import com.semi.learn.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;

	@Override
	public boolean delMember(MemberDto dto) {
		return dao.delMember(dto) > 0;
	}
}





























