package com.semi.learn.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import com.semi.learn.service.ClsService;
import com.semi.learn.util.clsUtil;


@Controller
public class ClsController {
	
	@Autowired
	ClsService service;
	
	@GetMapping(value = "mainpage")
	public String mainpage(Model model) {
		System.out.println("MemberController mainpage " + new Date());
		
		ClsParam param = new ClsParam(null, null, 0, 0, 0);
		
		List<ClsDto> clslist = service.clslist(param);
		List<ClsDto> bestlist = service.bestClslist();
		
		model.addAttribute("clslist", clslist);
		model.addAttribute("bestlist", bestlist);
		
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
		
		return "defaultCls/recClslist";
	}
	
	// 인기 클래스 목록
	@GetMapping(value = "bestCls")
	public String popularClslist(Model model) {
		System.out.println("MemberController bestClslist " + new Date());
		
		List<ClsDto> list = service.bestClslist();
		
		model.addAttribute("bestClslist", list);
		
		return "defaultCls/bestClslist";
	}
	
	@PostMapping(value = "writeCls")
	public String pdsupload(Model model, ClsDto dto, @RequestParam(value = "fileload", required = false) MultipartFile fileload, HttpServletRequest req) throws IOException { // HttpServletRequest는 업로드 경로를 수정하기 위해 사용 됨
		// filename 취득
		String filename = fileload.getOriginalFilename(); // 원본의 파일명
		
		String filecheck = filename.substring(filename.indexOf('.')); // 확장자 제한
		int filesize = fileload.getBytes().length; // 파일크기 제한
		String notimage = "";
		String toobig = "";
		
		if (filecheck.equals(".png") || filecheck.equals(".jpg")) {
			if (filesize < 1048577) { // 1MB
				dto.setFilename(filename);
				
				String fupload = req.getServletContext().getRealPath("/upload");
				
				System.out.println("fupload: " + fupload);
				
				// 파일명을 충돌하지 않는 이름(Date)으로 변경
				String newfilename = clsUtil.getNewFileName(filename);
				
				dto.setNewfilename(newfilename); // 변경된 파일명
				
				File file = new File(fupload + "/" + newfilename);
				
				try {
					// 실제 파일 생성 + 기입 = 업로드
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
					
					// db에 저장
					service.uploadCls(dto);
				}
				catch (IOException e) {
					e.printStackTrace();
				}
			}
			else {
				toobig = "toobig";
				
				model.addAttribute("toobig", toobig);
				
				return "message";
			}
		}
		else {
			notimage = "notimage";
			
			model.addAttribute("notimage", notimage);
			
			return "message";
		}
		
		return "redirect:/manageCls?id=" + dto.getId();
	}
	
	@PostMapping(value = "updateCls")
	public String updateCls(Model model, ClsDto dto, @RequestParam(value = "fileload", required = false) MultipartFile fileload, HttpServletRequest req) throws IOException {
		String originalFileName = fileload.getOriginalFilename();
		
		String filecheck = originalFileName.substring(originalFileName.indexOf('.')); // 확장자 제한
		int filesize = fileload.getBytes().length; // 파일크기 제한
		String clsnotimage = "";
		String clstoobig = "";
		
		if (filecheck.equals(".png") || filecheck.equals(".jpg")) {
			if (filesize < 1048577) { // 1MB
				if (originalFileName != null && !originalFileName.equals("")) { // 파일이 변경됨
					String newfilename = clsUtil.getNewFileName(originalFileName);
					
					dto.setFilename(originalFileName);
					dto.setNewfilename(newfilename);
					
					String fupload = req.getServletContext().getRealPath("/upload");
					File file = new File(fupload + "/" + newfilename);
					
					try {
						// 새로운 파일로 업로드
						FileUtils.writeByteArrayToFile(file, fileload.getBytes());
						
						// db 갱신
						service.updateCls(dto);
					}
					catch (IOException e) {
						e.printStackTrace();
					}
				}
				else { // 파일이 변경되지 않음
					service.updateCls(dto);
				}
			}
			else {
				clstoobig = "clstoobig";
					
				model.addAttribute("clstoobig", clstoobig);
				model.addAttribute("seq", dto.getSeq());
				
				return "message";
			}
		}
		else {
			clsnotimage = "clsnotimage";
				
			model.addAttribute("clsnotimage", clsnotimage);
			model.addAttribute("seq", dto.getSeq());
			
			return "message";
		}
			
		return "redirect:/manageCls?id=" + dto.getId();
	}
	
	@GetMapping(value = "clsDetail")
	public String clsDetail(Model model, int seq) {
		ClsDto list = service.getCls(seq);
		
		model.addAttribute("list", list);
		
		return "defaultCls/clsDetail";
	}
}
