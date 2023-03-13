package mul.cam.a.member;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.service.MemberService;

@Controller
public class MemberController {
	// service 접근(생성)
	@Autowired
	MemberService service; // db는 무조건 service를 통한다
	
	@GetMapping(value = "mainpage.do")
	public String main() {
		System.out.println("MemberController mainpage " + new Date());
		
		return "mainpage";
	}
}



























