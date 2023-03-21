package com.semi.learn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.learn.dto.ClsDto;
import com.semi.learn.dto.ReviewDto;
import com.semi.learn.dto.ReviewParam;
import com.semi.learn.service.DetailService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService service;
	
	@GetMapping("clsDetail")
	public String clsDetail(Model model, int seq) {
		// 강의 정보
		ClsDto list = service.getCls(seq);
		
		// 리뷰 페이지
		ReviewParam param = new ReviewParam(seq, 0, 1, 5);
		
		List<Map<String, Object>> reviewlist = service.getReview(param);
		int len = service.countReview(seq);
		
		int totalPages = len / 5;
		if((len % 5) > 0) {
			totalPages += 1;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("totalPages", totalPages);
		
		return "defaultCls/clsDetail";
	}
	
	@ResponseBody
	@GetMapping("clsDetailAf")
	public boolean[] clsDetailAf(String id, int seq) {
		
		// 페이지 상단 버튼 표현 바꾸기 위해
		ClsDto dto = new ClsDto();
		dto.setId(id);
		dto.setSeq(seq);
		
		// 로그인한 아이디가 수강신청한 상태인지 확인
		boolean taking = service.checkTaking(dto);
		
		// 좋아요 여부 확인
		boolean liking = service.checkLiking(dto);
		
		boolean[] arr = {taking, liking};
		return arr;
	}
	
	@ResponseBody
	@GetMapping("reviewPage")
	public List<Map<String, Object>> reviewPage(ReviewParam param) {

		// 리뷰 페이지
		int pn = param.getPageNumber();
		int start = (pn * 5) + 1;
		int end = (pn + 1) * 5;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<Map<String, Object>> list = service.getReview(param);
		
		return list;
	}
	
	@PostMapping("writeReview")
	public String writeReview(ReviewDto dto, Model model) {
		String str = "";
		if(service.writeReview(dto)) {
			str = "OK";
		} else {
			str = "NO";
		}
		
		model.addAttribute("review", str);
		model.addAttribute("seq", dto.getCls_seq());
		
		return "message";
	}
	
	@PostMapping("updateReview")
	public String updateReview(ReviewDto dto, Model model) {
		
		if(!service.updateReview(dto)) {
			System.out.println("리뷰 수정 실패");
		}
		
		return "redirect:/clsDetail?seq=" + dto.getCls_seq();
	}
	
	@ResponseBody
	@PostMapping("takeCls")
	public boolean takeCls(ClsDto dto) {
		
		boolean taking = service.checkTaking(dto);
		
		if(taking) {
			service.notTakeCls(dto);
		} else {
			service.takeCls(dto);
		}
		return !taking;
	}
	
	@ResponseBody
	@PostMapping("likeCls")
	public boolean likeCls(ClsDto dto) {
		
		boolean liking = service.checkLiking(dto);
		
		if(liking) {
			service.notLikeCls(dto);
		} else {
			service.likeCls(dto);
		}
		return !liking;
	}
}
