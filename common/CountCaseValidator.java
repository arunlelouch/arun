package com.chegus.geni.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.chegus.geni.util.CheckConditionUtil;
import com.chegus.geni.util.ReflectionUtil;
@SuppressWarnings({"rawtypes","unchecked"})
public class CountCaseValidator implements ConstraintValidator<CountCase, String>  {

	private CountMode countMode;
	private String classname;
	private String fieldname;

	@Autowired
	CommonService commonService;

	@Override
	public void initialize(CountCase constraintAnnotation) 
	{
		this.countMode=constraintAnnotation.value();
		this.classname=constraintAnnotation.classname();
		this.fieldname=constraintAnnotation.fieldname();
	}

	//Integer flag=0;
	boolean flag=true;
	@Override
	public boolean isValid(String idvalue, ConstraintValidatorContext constraintContext) 
	{
		if (idvalue == null)
			return true;
		List<Object> objnum=new ArrayList<Object>();
		HashMap<String, String> logicaloptr=new HashMap<String, String>();
		logicaloptr.put(fieldname, "eq");

		try
		{
			Class clazz = Class.forName(classname);
			Object obj = clazz.newInstance();   
			if(CheckConditionUtil.checkNotNull(idvalue))
			{
				ReflectionUtil.setValue(obj,fieldname, idvalue);
				if(null != commonService)
					objnum =commonService.commonSearch(obj, logicaloptr,null,null,null);
			}
			if(objnum.size()==0 && countMode==CountMode.countzero)
			{
				flag=true;
			}
			else if(objnum.size()==0 && countMode==CountMode.countone)
			{
				flag=false;
			}
			else if(objnum.size()!=0 && countMode==CountMode.countone)
			{
				flag=true;
			}
			else if(objnum.size()!=0 && countMode==CountMode.countzero)
			{
				flag=false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
}