package com.chegus.geni.common;


import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

@SuppressWarnings({"serial", "unchecked"})
public class AccessTag extends TagSupport
{
	private Object link;
	private String accessId;
	
	public String getAccessId() {
		return accessId;
	}

	public void setAccessId(String accessId) {
		this.accessId = accessId;
	}

	public Object getLink() {
		return link;
	}

	public void setLink(Object link) {
		this.link = link;
	}

	@Override
    public int doStartTag() throws JspException
	{
		try {
//			String accessList=pageContext.getSession().getAttribute("featureAccess").toString();
			String accessList="2$4$1$6$5$3$15$";
			Map<String,String> accID=(Map<String, String>) pageContext.getSession().getAttribute("accessMp");
			accessList="$"+accessList;
			if(accessList.contains("$"+accID.get(accessId)+"$"))
			{
				pageContext.setAttribute("allow","allowed");
				pageContext.setAttribute("addcls","");
				pageContext.setAttribute("roleAcessId", accessId);
			}
			else
			{
				pageContext.setAttribute("allow","notallowed");
				pageContext.setAttribute("addcls","imgBlur");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}
}
