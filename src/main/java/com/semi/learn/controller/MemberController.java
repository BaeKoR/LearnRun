package com.semi.learn.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.learn.service.MemberService;

@Controller
public class MemberController {
	// service 접근(생성)
	@Autowired
	MemberService service; // db는 무조건 service를 통한다
	
	@GetMapping(value = "mainpage")
	public String mainpage() {
		System.out.println("MemberController mainpage " + new Date());
		
		return "mainpage";
	}
	
	@GetMapping(value = "login")
	public String login() {
		System.out.println("MemberController login " + new Date());
		
		return "login/login";
	}
}



























