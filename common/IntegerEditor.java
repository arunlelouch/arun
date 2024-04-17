package com.chegus.geni.common;

import java.beans.PropertyEditorSupport;

import com.chegus.geni.util.ApplicationConstants;
import com.chegus.geni.util.CheckConditionUtil;

public class IntegerEditor extends PropertyEditorSupport
{
	public void setAsText(String value) 
	{
		if(CheckConditionUtil.checkNotNull(value))
		{
			String tempValue = value.replaceAll(ApplicationConstants.SEPARATOR_REMOVER, "");
			if(CheckConditionUtil.checkNotNull(tempValue))
			{
				setValue(tempValue);
			}
		}
	}
}
