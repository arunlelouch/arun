package com.chegus.geni.common;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
public class CommonAspects
{
	 /**
	   * A join point is in the controller layer if the method is defined
	   * in a type in the com.chegus.geni.controllerr package or any sub-package
	   * under that.
	   */
	  @Pointcut("within(com.chegus.geni.controller..*) || within(com.chegus.geni.crm.controller..*)")
	  public void controllerLayerWithinPointcut() {}


	  /**
	   * A join point is in the controller layer if the method is defined
	   * in a type in the com.chegus.geni.controller package or any sub-package
	   * under that.
	   */
	  @Pointcut("(execution(* com.chegus.geni.controller.*.*(..)) && args(request,..)) || (execution(* com.chegus.geni.crm.controller.*.*(..)) && args(request,..))")
	  public void controllerLayerExecutionPointcutWithParameter(HttpServletRequest request) {}
	  
	
	@Pointcut("execution(* com.chegus.geni.controller.LoginPageController.validatingUser(..))")
	public void controllerLayerExecutionPointcut() {}
}
