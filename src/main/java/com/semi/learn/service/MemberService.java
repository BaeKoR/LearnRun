package com.semi.learn.service;

import com.semi.learn.dto.MemberDto;

public interface MemberService {
	

	boolean addMember(MemberDto dto) throws Exception;
	
	boolean checkId(String id);
	
	MemberDto login(MemberDto dto);
	
	int emailCheck(String email);	// int로 체크
	
	MemberDto findId(MemberDto dto);
	
	// 이메일 인증
	// 인증키 디비에 넣어주기
	int updateMailKey(MemberDto dto);
	
	int updateMailAuth(MemberDto dto);
	int emailAuthFail(String id);
	
	int pwdUpdate(MemberDto dto);
	
}
