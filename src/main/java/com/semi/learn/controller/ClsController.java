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
	public String myReview(ReviewParam param, Model model) {
		
//		Map<String, Object> map = 원글의 제목 가져오기
		
		int pn = param.getPageNumber();
		int start = (pn * 5) + 1;
		int end = (pn + 1) * 5;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<Map<String, Object>> list = service.getMyReview(param);
		System.out.println(list.toString());
		int len = list.size();
		
		int totalPages = len / 5;
		if((len % 5) > 0) {
			totalPages += 1;
		}
		
		model.addAttribute("myReview", list);
		model.addAttribute("pageNumber", pn);
		model.addAttribute("totalPages", totalPages);
		
		return "mypage/myReview";
	}
	
}
