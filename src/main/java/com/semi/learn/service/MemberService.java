package com.semi.learn.service;

import com.semi.learn.dto.MemberDto;

public interface MemberService {
	

	boolean addMember(MemberDto dto) throws Exception;
	
	boolean checkId(String id);
	
	MemberDto login(MemberDto dto);
	
	MemberDto emailCheck(String email);	// dto값 보내줌
	
	MemberDto findId(MemberDto dto);
	
	MemberDto getMember(MemberDto dto);
	
	// 이메일 인증
	// 인증키 디비에 넣어주기
	int updateMailKey(MemberDto dto);
	
	int updateMailAuth(MemberDto dto);
	int emailAuthFail(String id);
	
	int pwdUpdate(MemberDto dto);
	
	// 메일발송
	void emailAuthSend(MemberDto dto, String mail_key) throws Exception;
	
	void pwdResetEmail(MemberDto dto, String mail_key) throws Exception;
}
