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
import com.semi.learn.util.clsUtil;

@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@GetMapping("myCls")
	public String myCls(Model model, String id) {
		
		List<ClsDto> list = service.getTakingCls(id);
		
		model.addAttribute("takecls", list);
		
		return "mypage/myCls";
	}
	
	@GetMapping("likeCls")
	public String likeCls(Model model, String id) {
		
		List<ClsDto> list = service.getLikeCls(id);
		
		model.addAttribute("likecls", list);
		
		return "mypage/likeCls";
	}
	
	@GetMapping("manageCls")
	public String manageCls(Model model, String id) {
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
	public String updateLesson(int seq, Model model) {
		ClsDto list = service.getcls(seq);
		
		model.addAttribute("list", list);
		
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
	public String updateMember(String id, Model model) {
		
		MemberDto dto = service.getmember(id);
		
		model.addAttribute("dto", dto);
		
		return "mypage/updateMember";
	}
	
	@PostMapping(value = "updateMemberAf")
	public String updateMemberAf(Model model, MemberDto dto, @RequestParam(value = "fileload", required = false) MultipartFile fileload, HttpServletRequest req) throws IOException {
		String originalFileName = fileload.getOriginalFilename();
		
		String filecheck = originalFileName.substring(originalFileName.indexOf('.')); // 확장자 제한
		int filesize = fileload.getBytes().length; // 파일크기 제한
		String profilenotimage = "";
		String profiletoobig = "";
		
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
						service.updateMemerAf(dto);
					}
					catch (IOException e) {
						e.printStackTrace();
					}
				}
				else { // 파일이 변경되지 않음
					service.updateMemerAf(dto);
				}
			}
			else {
				profiletoobig = "profiletoobig";
					
				model.addAttribute("profiletoobig", profiletoobig);
				model.addAttribute("id", dto.getId());
				
				return "message";
			}
		}
		else {
			profilenotimage = "profilenotimage";
				
			model.addAttribute("profilenotimage", profilenotimage);
			model.addAttribute("id", dto.getId());
			
			return "message";
		}
		
		return "redirect:/pwdCheck";
	}
	
	@GetMapping("quit")
	public String quit(String id) {
		
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
