package com.semi.learn.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.semi.learn.dto.MemberDto;

@Aspect
public class AopProc {
	
	@Around("within(com.semi.learn.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable{
		// logger
		String signatureStr = joinpoint.getSignature().toShortString();
		
		try {
			Object obj = joinpoint.proceed();
			
			System.out.println("AOP log: " + signatureStr + " 메소드 실행 " + new Date());
			
			return obj;
		}
		finally {
			//System.out.println("실행 후: " + System.currentTimeMillis());
		}
	}
	
	@Around("within(com.semi.learn.controller.MypageController) or within(com.semi.learn.controller.LessonController)")
	public Object sessionAop(ProceedingJoinPoint joinpoint) throws Throwable {
		// session check
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if(req != null) {
			
			HttpSession session = req.getSession();
			MemberDto login = (MemberDto)session.getAttribute("login");
			
			// 비로그인 상태일 때
			if(login == null) {
				System.out.println("Session Out");
				return "redirect:/logout";
			}
			
			// url 파라미터의 id와 세션 id가 다를 때
			Object[] arr = joinpoint.getArgs();
			for(Object a : arr) {
				if(a instanceof String && !a.equals(login.getId())) {
					System.out.println("Session Out " + a + " != " + login.getId());
					return "redirect:/logout";
				}
			}
		}
		Object obj = joinpoint.proceed();
		return obj;
	}
}





























