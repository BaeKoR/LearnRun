package com.semi.learn.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
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
	public String manageCls(Model model, String id) {
		System.out.println("MemberController mainpage " + new Date());
		
		//ClsParam param = new ClsParam(null, null, 0, 0, 0);
		//List<ClsDto> list = service.clslist(param);
		
		List<ClsDto> list = service.clslist(id);
		
		model.addAttribute("clslist", list);
		
		return "mypage/manageCls";
	}
	
	@GetMapping("createLesson")
	public String createLesson() {
		
		return "mypage/createLesson";
	}
	
	@GetMapping("updateLesson")
	public String updateLesson() {
		
		return "mypage/updateLesson";
	}
	
	@GetMapping("myReview")
	public String myReview(String id, Model model) {
		
		List<Map<String, Object>> list = service.getMyReview(id);
	
		model.addAttribute("myReview", list);
		
		return "mypage/myReview";
	}
	
	@GetMapping("pwdCheck")
	public String pwdCheck() {
		
		return "mypage/pwdCheck";
	}
	
	@PostMapping("updateMember")
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
