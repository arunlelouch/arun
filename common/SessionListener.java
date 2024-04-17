package com.chegus.geni.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextImpl;

import com.chegus.geni.domain.UserHistoryDO;
import com.chegus.geni.service.UserhistoryService;
import com.chegus.geni.util.ApplicationConstants;
import com.chegus.geni.util.LoggerUtil;

@SuppressWarnings({"rawtypes","unchecked"})
public class SessionListener implements HttpSessionListener
{
	@Autowired
	UserhistoryService userhistoryService;
	
	public static List<HttpSession> list = new ArrayList<>();
	
	@Override
	public void sessionCreated(HttpSessionEvent se)
	{
		ApplicationConstants.isAccessValid = true;
		if(ApplicationConstants.isAccessValid)
		{
			HttpSession session = se.getSession();
			if (session.isNew())
				list.add(session);
		}
		else
		{
			se.getSession().invalidate();
			System.exit(-1);
		}	
	}
	 
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se)
	{    
		try {
			HttpSession session = se.getSession();
			 Integer usrHistryID = (Integer) session.getAttribute("usrHistId");
			 /*if(null != usrHistryID)
			 {
				 setLogoutHistory(usrHistryID, (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT"));
				 session.removeAttribute("usrHistId");
			 }*/
			 list.remove(session);
			 session.invalidate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		 
	}
	

	private void setLogoutHistory(Integer usrHistryID, SecurityContext securityContext)
	{
		try
		{
			/*UserHistoryDO userHistoryDO = userhistoryService.getUserHistoryDO(UserHistoryDO.class, usrHistryID);
			userHistoryDO.setLogoutDateTime(new Date());
			userhistoryService.updateUserHistoryDO(userHistoryDO);*/
			Logger existingLogger = LogManager.getLoggerRepository().exists(securityContext.getAuthentication().getName());
			existingLogger.info(" <------- Successfully Logged Out -------> ");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			LoggerUtil.getLogger().debug("Exception occured while adding Logout History", e);
		}
	}
}