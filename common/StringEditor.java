package com.chegus.geni.common;

import java.awt.Component;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.beans.PropertyChangeListener;
import java.beans.PropertyEditorSupport;

import com.chegus.geni.util.CheckConditionUtil;

public class StringEditor extends PropertyEditorSupport {
	
	@Override
	public String getAsText() {
		String s = null;
		if(null != getValue())
				{
					s = getValue().toString().trim();
				}
		return s;
	}


	@Override
	public void setAsText(String value) throws IllegalArgumentException {
		
		if(CheckConditionUtil.checkNotNull(value))
		setValue(value.trim());
	}


}
