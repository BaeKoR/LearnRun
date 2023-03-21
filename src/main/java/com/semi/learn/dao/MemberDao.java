package com.semi.learn.dao;

import com.semi.learn.dto.MemberDto;

public interface MemberDao {
	
	int addMember(MemberDto dto);
	
	int checkId(String id);
	
	MemberDto login(MemberDto dto);
	
	MemberDto emailCheck(String email);
	
	// 멤버정보확인	
	MemberDto getMember(MemberDto dto);
	
	// id찾기
	MemberDto findId(MemberDto dto);	
	
	// 이메일
	int updateMailKey(MemberDto dto);
	//
//	int updateMailKey(String email);
	
	int updateMailAuth(MemberDto dto);
	// 로그인할때 이메일인증했는지 확인
	int emailAuthFail(String id);
	
	// 비밀번호 재설정
	int pwdUpdate(MemberDto dto);
//	MemberDto pwdUpdate(MemberDto dto);
	
	
}
