package com.team.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Aspect
@Service
public class AfterReturningAdvice {
	@AfterReturning(pointcut="PointcutCommon.getPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		String method=jp.getSignature().getName();
		if (returnObj == null) {
			System.out.printf("[사후처리] 메소드명 : %s(), 리턴값 : %s\n",method, "리턴값 없음");
		} else {
			System.out.printf("[사후처리] 메소드명 : %s(), 리턴값 : %s\n",method,returnObj.toString());
		}
	}
}