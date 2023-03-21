package com.semi.learn.service.Impl;

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
		
        //회원가입
        int count = dao.addMember(dto);		// 회원가입 정보
        dao.updateMailKey(dto);	// regi에서 인증한 랜덤 인증키 저장         

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
	public MemberDto emailCheck(String email) {
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

	
	// 이메일 인증번호 발송
	@Override
	public void emailAuthSend(MemberDto dto, String mail_key) throws Exception {
				
		
		String mailContent = "<div style='text-align:center;'>" + 
                "<h1 style='color:black;'>LearnRun 메일인증</h1>" +
                "<p style='font-size:18px; color:#333; margin-top:30px; margin-bottom:20px;'>환영합니다!</p>" +
                "<p style='font-size:16px; color:#555; margin-top:20px; margin-bottom:30px;'>아래 인증번호를 확인해주세요.</p>" +
                "<div style='background-color:#E9ECEF; color:#333; font-size:20px; padding:10px; display:inline-block; border-radius:5px; margin-bottom:30px;'>" + mail_key + "</div>" +
                "<p style='font-size:14px; color:#999; margin-top:30px;'>본 이메일은 발신 전용입니다. 문의 사항은 고객센터를 이용해주세요.</p>" +
                "<p style='font-size:14px; color:#999;'>LearnRun | 서울특별시 강남구 테헤란로 1234</p>" +
            "</div>";

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[LearnRun] 회원가입 인증메일 입니다.");
		sendMail.setText(mailContent);
		sendMail.setFrom("learnrun.service@gmail.com", "LearnRun");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
		
		// addmember에서 해주므로 필요없음
//		dao.updateMailKey(dto);		

		
	}
	
	// 비밀번호 재설정 이메일 발송
	@Override
	public void pwdResetEmail(MemberDto dto, String mail_key) throws Exception {
		
		// 메일 내용
		String mailContent = "<div style='text-align:center;'>" +
                "<h1 style='color:black;'>LearnRun 비밀번호 재설정</h1>" +
                "<p style='font-size:18px; color:#333; margin-top:30px; margin-bottom:20px;'>안녕하세요, " + dto.getName() + "님!</p>" +
                "<p style='font-size:16px; color:#555; margin-top:20px; margin-bottom:30px;'>비밀번호를 재설정 하시려면 아래 링크를 클릭해주세요.</p>" +
                "<a href='http://localhost:8090/LearnRun/pwdUpdate?email=" + dto.getEmail() + "&mail_key=" + mail_key + "' style='display:inline-block; background-color:#FF4136; color:#fff; font-size:16px; text-align:center; padding:12px 20px; border-radius:5px; text-decoration:none; margin-bottom:30px;'>비밀번호 재설정</a>" +
                "<p style='font-size:14px; color:#999; margin-top:30px;'>본 이메일은 발신 전용입니다. 문의 사항은 고객센터를 이용해주세요.</p>" +
                "<p style='font-size:14px; color:#999;'>LearnRun | 서울특별시 강남구 테헤란로 1234</p>" +
                "</div>";		

		
		// 인증을 위한 이메일 발송	
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[LearnRun] " + dto.getName() + "님 비밀번호 재설정 이메일 입니다."); // 메일제목
		sendMail.setText(mailContent);
		sendMail.setFrom("learnrun.service@gmail.com", "LearnRun");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
		
		// 재설정시에 메일키 저장해주고 메일키랑 비교 후 비밀번호 변경
		dao.updateMailKey(dto);
		
		//  redisUtil.setDataExpire(authKey, email, 60 * 5L);
		
	}

	@Override
	public MemberDto getMember(MemberDto dto) {
		return dao.getMember(dto);
	}
}





























