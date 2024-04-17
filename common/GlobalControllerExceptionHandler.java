package com.chegus.geni.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.chegus.geni.controller.ErrorPageController;
import com.chegus.geni.util.LoggerUtil;

@ControllerAdvice
public class GlobalControllerExceptionHandler 
{	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception exception) 
	{
		LoggerUtil.getLogger().debug("Exception Details : ",exception);		
		
		ModelAndView modelAndView = new ModelAndView();
		ErrorPageController.errorPageDefaults(modelAndView);
	    modelAndView.addObject("name", exception.getClass().getSimpleName());
	    return modelAndView;
	}

}
