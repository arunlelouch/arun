package com.chegus.geni.common;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Component
public class CommonMessageSource {
	private static MessageSource messageSource;

	@Autowired
	public void setMessageSource(MessageSource messageSource) {
		CommonMessageSource.messageSource = messageSource;
	}

	public static String getMessage(String key) {
		return messageSource.getMessage(key, null, Locale.ENGLISH);
	}

	public static String getMessage(String key, Object obj[]) {
		return messageSource.getMessage(key, obj, Locale.ENGLISH);
	}
}