package com.semi.learn.service.Impl;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.semi.learn.dao.MemberDao;
import com.semi.learn.dto.MemberDto;
import com.semi.learn.mail.MailHandler;
import com.semi.learn.mail.TempKey;
import com.semi.learn.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	// Dao 접근(생성)
	@Autowired
	MemberDao dao;
	
	 @Autowired
	JavaMailSender mailSender;	// 이메일

	@Override
	public boolean addMember(MemberDto dto) throws Exception {
		
		//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
        String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
       dto.setMail_key(mail_key);
		
        //회원가입
        int count = dao.addMember(dto);		// 회원가입 정보
        dao.updateMailKey(dto);	// 랜덤 인증키 저장         

		return count>0?true:false;
	}

	@Override
	public boolean checkId(String id) {
		int count = dao.checkId(id);
		return count>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public int updateMailKey(MemberDto dto) {
		return dao.updateMailKey(dto);
	}

	@Override
	public int updateMailAuth(MemberDto dto) {
		 return dao.updateMailAuth(dto);
	}

	@Override
	public int emailAuthFail(String id) {
		 return dao.emailAuthFail(id);
	}

	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	@Override
	public int pwdUpdate(MemberDto dto) {
		return dao.pwdUpdate(dto);
	}

	@Override
	public MemberDto findId(MemberDto dto) {
		return dao.findId(dto);
	}
}





























