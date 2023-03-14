package com.semi.learn.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.learn.dto.MemberDto;
import com.semi.learn.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping(value = "login")
	public String login() {
		
		return "login/login";
	}
	
	@GetMapping("updateMember")
	public String updateMember() {
		
		return "mypage/updateMember";
	}
	
	@GetMapping("quit")
	public String quit() {
		
		return "mypage/quit";
	}
	
	@PostMapping("quitAf")
	public String quitAf(MemberDto dto, Model model) {
		String quit = "";
		if(service.delMember(dto)) {
			quit = "OK";
		} else {
			quit = "NO";
		}
		model.addAttribute("quit", quit);
		return "message";
	}
	
}



























