package com.semi.learn.controller;


import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.learn.dto.MemberDto;
import com.semi.learn.mail.MailHandler;
import com.semi.learn.mail.TempKey;
import com.semi.learn.service.MemberService;

@Controller
public class MemberController {
	// service 접근(생성)
	@Autowired
	MemberService service; // db는 무조건 service를 통한다

	@Autowired
	JavaMailSender mailSender;

	
	@GetMapping(value = "login")
	public String login() {

		return "login/login";
	}

	// login 후
	@PostMapping(value = "loginAf")
	public String login(HttpServletRequest req, Model model, MemberDto dto) {

		MemberDto mem = service.login(dto); // login한 dto 받아오기
		String msg = "";
		if (mem != null) { // login 성공
			req.getSession().setAttribute("login", mem); // session에 로그인정보 저장
//			req.getSession().setMaxInactiveInterval(60 * 60 * 2);	// 2시간 저장			
			msg = "LOGIN_OK";
		} else { // login 실패
			msg = "LOGIN_FAIL";
		}
		model.addAttribute("loginmsg", msg);

		return "message"; // message.jsp로 이동
	}
	
	// logout 후
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest req) {
	    HttpSession session = req.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    return "redirect:/login";	// 로그아웃 후 로그인페이지로
	}

	// 회원가입.jsp로 보내기
	@GetMapping(value = "regi")
	public String regi() {
		return "login/regi";
	}

	// 회원가입완료 버튼 누른 후
	@PostMapping(value = "regiAf")
	public String regiAf(MemberDto dto, Model model) throws Exception {

		boolean isS = service.addMember(dto);
		
		// 인증번호 업데이트
		service.updateMailKey(dto);
		// 인증여부 업데이트
		service.updateMailAuth(dto);		

		System.out.println(dto.getMail_key());

		String regimsg = "";
		if (isS) {
			regimsg = "MEMBER_ADD_YES";
		} else {
			regimsg = "MEMBER_ADD_NO";
		}
		model.addAttribute("regimsg", regimsg);

		return "message"; // message.jsp로 가라

	}

	// 이메일 인증 보내기
	@ResponseBody
	@GetMapping(value = "emailAuth")
	public String emailSend(MemberDto dto) throws Exception {

		// 랜덤번호 생성 TempKey클래스 불러옴
		String mail_key = new TempKey().getKey(10, false); // 랜덤키 길이 설정
		System.out.println(mail_key); // 메일키 확인
		
		// 이메일인증 메일발송
		service.emailAuthSend(dto, mail_key);		
		
		// 인증키 보내주기.
		return mail_key;


	}

	// 비밀번호 재설정 이메일 전송
	@ResponseBody
	@GetMapping(value = "pwdResetEmail")
	public String pwdResetEmail(MemberDto dto) throws Exception {

		// 랜덤번호 생성 TempKey클래스 불러옴
		String mail_key = new TempKey().getKey(10, false); // 랜덤키 길이 설정
		System.out.println(mail_key); // 메일키 확인
		
		dto.setMail_key(mail_key);
		
		service.pwdResetEmail(dto, mail_key);	// 비밀번호재설정이메일 발송
		service.updateMailKey(dto);
//		System.out.println(dto.getMail_key()+"~~");

		// 인증키 보내주기.
		return mail_key;

	}

	@ResponseBody
	@PostMapping(value = "checkId")
	public String checkId(String id) {

		boolean isS = service.checkId(id);

		if (isS == true) { // id가 잇음
			return "YES";
		}
		return "NO"; // id가 없음
	}

	// 아이디 찾기페이지 이동
	@GetMapping(value = "findId")
	public String findId() {
		return "login/findid";
	}

	@ResponseBody
	@GetMapping(value = "findIdAf")
	public MemberDto findIdAf(MemberDto dto) {
		MemberDto mem = service.findId(dto);		
		
		return mem;
	}

	// 비밀번호 찾기페이지 이동
	@GetMapping(value = "findPassword")
	public String findPassword() {
		return "login/findpwd";
	}

	// 가입된 이메일인지 확인
	@ResponseBody
	@GetMapping(value = "emailCheck")
	public MemberDto emailCheck(String email) {

		MemberDto dto = service.emailCheck(email);
		
		return dto;		

	}

	// 비밀번호 재설정 페이지
	@GetMapping(value = "pwdUpdate")
	public String pwdUpdate(MemberDto dto) {
		return "login/pwdupdate";
	}

	@ResponseBody
	@PostMapping(value = "pwdUpdateAf")
	public String pwdUpdateAf(MemberDto dto) {

		// service.updateMailKey(dto);
		int count = service.pwdUpdate(dto);		

		if (count > 0) {
			return "UPDATE_OK";
		}
		return "UPDATE_FAIL";
	}
	
	// 멤버정보 가져오기
	@ResponseBody
	@GetMapping(value = "getMember")
	public MemberDto getMember(MemberDto dto) {
		 
		MemberDto mem = service.getMember(dto);
		
		return mem;		
	}

}
