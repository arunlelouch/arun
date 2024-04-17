package com.chegus.geni.common;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.chegus.geni.common.CommonMessageSource;
import com.chegus.geni.util.CheckConditionUtil;

public class DateEditor extends PropertyEditorSupport 
{
	private static final String uiDatePattern =  CommonMessageSource.getMessage("UIDatePattern").trim(); /*"dd-MM-yyyy";*/ 
	private static final String dbDatePattern =  CommonMessageSource.getMessage("DBDatePattern").trim(); /*"yyyy-MM-dd";*/

	public void setAsText(String value) 
	{
		try 
		{
			if(CheckConditionUtil.checkNotNull(value))
			{
				SimpleDateFormat sdfSource = new SimpleDateFormat(uiDatePattern);
				java.util.Date uiDate = sdfSource.parse(value.toString());
				//System.out.println(uiDate);
				SimpleDateFormat dbSimpleDateFormat = new SimpleDateFormat(dbDatePattern);
				setValue(dbSimpleDateFormat.parse(dbSimpleDateFormat.format(uiDate)));
			}
		} 
		catch(ParseException e) 
		{
			e.printStackTrace();
			//setValue(null);
		}
	}

	public String getAsText() 
	{
		String s = "";
		if (getValue() != null) 
		{
			s = new SimpleDateFormat(uiDatePattern).format((Date) getValue());
		}
		return s;
	}
}
