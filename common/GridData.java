package com.chegus.geni.common;

import com.chegus.geni.util.CheckConditionUtil;

public class GridData implements DisplayTagGridData{

	public MainGridData mainGridData = new MainGridData();
	public SubGridData subGridData = new SubGridData();
	
	private String action = "noaction";
	private String grid  = "search";
	private String reqsubGridUserId; 
	private Integer subGridUserId;
	public String getAction() {
		return action;
	}
	
	public void setAction(String action) {
		
	if(!CheckConditionUtil.checkNotNull(action))
		this.action = "noaction";
	else
		this.action = action;
	}
	
	public String getGrid() {
		return grid;
	}
	
	public void setGrid(String grid) {
		
		if(!CheckConditionUtil.checkNotNull(grid))
			this.grid = "search";
		else
		this.grid = grid;
		
	}

	public String getReqsubGridUserId() {
		return reqsubGridUserId;
	}

	public void setReqsubGridUserId(String reqsubGridUserId) {
		this.reqsubGridUserId = reqsubGridUserId;
	}

	public Integer getSubGridUserId() {
		return subGridUserId;
	}

	public void setSubGridUserId(Integer subGridUserId) {
		this.subGridUserId = subGridUserId;
	}

	
	
}
