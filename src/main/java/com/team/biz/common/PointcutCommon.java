package com.team.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.team.biz..*Impl.*(..))")
	public void allPointcut() {}
	@Pointcut("execution(* com.team.biz..*Impl.get*(..))")
	public void getPointcut() {}
}
