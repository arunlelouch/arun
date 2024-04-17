package com.chegus.geni.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.chegus.geni.util.LoggerUtil;

@Component 
@Aspect
public class CommonLoggingAspects
{
	@Before("com.chegus.geni.common.CommonAspects.controllerLayerWithinPointcut()")
	public void logBefore(JoinPoint joinPoint)
	{
		LoggerUtil.getLogger().info("Execution started in "+joinPoint.getTarget().getClass().getSimpleName()+"'s "+ joinPoint.getSignature().getName()+ " method ");
	}
	
	
	@After("com.chegus.geni.common.CommonAspects.controllerLayerWithinPointcut()")
	public void logAfter(JoinPoint joinPoint)
	{
		LoggerUtil.getLogger().info("Execution completed in "+joinPoint.getTarget().getClass().getSimpleName()+"'s "+ joinPoint.getSignature().getName()+ " method ");
	}

	
	@AfterThrowing(pointcut = "com.chegus.geni.common.CommonAspects.controllerLayerWithinPointcut()", throwing = "exception")
	public void logAfterThrowing(JoinPoint joinPoint, Exception exception)
	{
		 LoggerUtil.getLogger().info("Executing After Throwing Exception in "+joinPoint.getTarget().getClass().getSimpleName()+"'s "+ joinPoint.getSignature().getName()+
				 " method \n Error Cause : "+exception);		 		 
	}

}