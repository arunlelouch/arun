package com.chegus.geni.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.chegus.geni.util.ApplicationConstants;

@Component
public class SessionValidatorInterceptor implements HandlerInterceptor
{
	public static boolean isAccessValid = true;
	
	/**
	 * Callback after completion of request processing, that is, after rendering the view. 
	 * Will be called on any outcome of handler execution, thus allows for proper resource cleanup. 
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception
	{
	  	/* System.out.println("After "+request.getRequestURL()+"?"+request.getQueryString()); */
	}
		
	/**
	 * Intercept the execution of a handler. Called after HandlerAdapter actually invoked the handler, but before the DispatcherServlet renders the view. 
	 * Can expose additional model objects to the view via the given ModelAndView. 
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception
	{
		if("true".equals((String)request.getParameter(ApplicationConstants.BRANCH_PREFERENCE_DELETE_KEY)))
		{
			String viewName = modelAndView.getViewName() == null ? "" : modelAndView.getViewName();			
			
			if(!(viewName.contains(ApplicationConstants.BRANCH_PREFERENCE_KEY) || modelAndView.getModel().containsKey(ApplicationConstants.BRANCH_PREFERENCE_KEY)))
			{
				modelAndView.addObject(ApplicationConstants.BRANCH_PREFERENCE_KEY,(String)request.getParameter(ApplicationConstants.BRANCH_PREFERENCE_KEY));
			}			
		}
	   /* System.out.println("POST  "+request.getRequestURL()+"?"+request.getQueryString()); */
	}
	
	/**
	 * Intercept the execution of a handler. Called after HandlerMapping determined an appropriate handler object, but before HandlerAdapter invokes the handler. 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception
	{
		/* System.out.println("pre "+request.getRequestURL()+"?"+request.getQueryString()); */
		return isAccessValid;		
	}
}