package com.chegus.geni.common;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;


@ControllerAdvice
public class GlobalBindingInitializer
{
	@InitBinder
	public void initListBinder(WebDataBinder binder)
	{
		binder.setAutoGrowCollectionLimit(100000);
	    binder.registerCustomEditor(Date.class, new DateEditor());
	    binder.registerCustomEditor(BigDecimal.class, new BigDecimalEditor());
	    binder.registerCustomEditor(Integer.class, new IntegerEditor());
	}
}
