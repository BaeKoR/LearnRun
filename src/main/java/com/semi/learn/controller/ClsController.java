package com.semi.learn.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ClsParam;
import com.semi.learn.service.ClsService;


@Controller
public class ClsController {
	
	@Autowired
	ClsService service;
	
	@GetMapping(value = "mainpage")
	public String mainpage(Model model) {
		System.out.println("MemberController mainpage " + new Date());
		
		ClsParam param = new ClsParam(null, null, 0, 0, 0);
		
		List<ClsDto> list = service.clslist(param);
		
		model.addAttribute("clslist", list);
		
		return "mainpage";
	}
	
	// 클래스 목록
	@GetMapping(value = "cls")
	public String clslist(Model model, ClsParam param) {
		System.out.println("MemberController clslist " + new Date());
		
		List<ClsDto> list = service.clslist(param);
		
		model.addAttribute("clslist", list);
		model.addAttribute("category", param.getCategory());
		model.addAttribute("search", param.getSearch());
		
		return "cls/clslist";
	}
	
	// 추천 클래스 목록
	@GetMapping(value = "recCls")
	public String recClslist(Model model) {
		System.out.println("MemberController recClslist " + new Date());
		
		List<ClsDto> cookReclist = service.recClslist("cook");
		List<ClsDto> designReclist = service.recClslist("design");
		
		model.addAttribute("cookReclist", cookReclist);
		model.addAttribute("designReclist", designReclist);
		
		return "recCls/recClslist";
	}
	
	// 인기 클래스 목록
	@GetMapping(value = "bestCls")
	public String popularClslist(Model model) {
		System.out.println("MemberController bestClslist " + new Date());
		
		List<ClsDto> list = service.bestClslist();
		
		model.addAttribute("bestClslist", list);
		
		return "bestCls/bestClslist";
	}

}
