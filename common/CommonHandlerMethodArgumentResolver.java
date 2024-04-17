package com.chegus.geni.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.chegus.geni.annotation.DisplayTag;
import com.chegus.geni.pagination.util.PaginationUtil;
import com.chegus.geni.util.ApplicationConstants;
import com.chegus.geni.util.CheckConditionUtil;

public class CommonHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver 
{
	@Override
	public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, 
			NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception 
	{
		HttpServletRequest httprequest = (HttpServletRequest) nativeWebRequest.getNativeRequest();
	    HttpSession session = httprequest.getSession(false);
	  
 	    DisplayTag displayTag = (DisplayTag)methodParameter.getParameterAnnotation(DisplayTag.class); 
	    if(null != displayTag)
	    {
	    	DisplayTagGridData displayTagGridData = null;
	    	displayTagGridData =  new GridData();
	    	
	    	PaginationUtil newPaginationUtil = new PaginationUtil();
	    	String reqsubGridUserId = httprequest.getParameter("subGridSearchId");
	    	
	    	if (CheckConditionUtil.checkNotNull(reqsubGridUserId))
			{
	    		((GridData)displayTagGridData).setReqsubGridUserId(reqsubGridUserId);
				((GridData)displayTagGridData).setSubGridUserId(Integer.parseInt(reqsubGridUserId));
				session.setAttribute(ApplicationConstants.SUBGRIDEXPORTID, ((GridData)displayTagGridData).getSubGridUserId());
			}
	    	String action = httprequest.getParameter("action");
			String grid =httprequest.getParameter("grid");
			
			((GridData)displayTagGridData).setAction(action);
			((GridData)displayTagGridData).setGrid(grid);
			
//			GridData gridData = (GridData)displayTagGridData;
			displayTagGridData = newPaginationUtil.setMainGridDefaultData(httprequest,displayTagGridData);
			displayTagGridData = newPaginationUtil.setSubGridDefaultData(httprequest, displayTagGridData);
	    	return displayTagGridData;
	    }
	    return WebArgumentResolver.UNRESOLVED;
	}

	@Override
	public boolean supportsParameter(MethodParameter methodParameter) 
	{
		return methodParameter.getParameterAnnotation(DisplayTag.class) != null;
	}	
}