package mul.cam.a.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import mul.cam.a.dto.MemberDto;

@Aspect
public class AopProc {
	@Around("within(mul.cam.a.controller.*)")
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
}





























