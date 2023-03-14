package com.semi.learn.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;
import com.semi.learn.service.ClsService;

@Controller
public class ClsController {
	
	@Autowired
	ClsService service;
	
	@GetMapping(value = "mainpage")
	public String mainpage() {
		
		return "mainpage";
	}
	
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
	
}
