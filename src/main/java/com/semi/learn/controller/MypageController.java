package com.semi.learn.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.learn.dto.MemberDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;
import com.semi.learn.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@GetMapping("myCls")
	public String myCls() {
		
		return "mypage/myCls";
	}
	
	@GetMapping("manageCls")
	public String manageCls() {
		
		return "mypage/manageCls";
	}
	
	@GetMapping("myReview")
	public String myReview(String id, Model model) {
		
		List<Map<String, Object>> list = service.getMyReview(id);
	
		model.addAttribute("myReview", list);
		
		return "mypage/myReview";
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
