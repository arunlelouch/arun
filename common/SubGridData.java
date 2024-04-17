package com.chegus.geni.common;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chegus.geni.pagination.IExtendedPaginatedList;

@SuppressWarnings("rawtypes")
public class SubGridData {
	private int startIndex = 0;
	private int endIndex = 10;
	private Integer numberOfRecordsCreated = 0;
	private Integer subGridUserId = 0;
	private Integer subGridRequestPage = 0;
	private String subGridSortDirection;
	private String subGridSortCriteria ;
	private IExtendedPaginatedList subGridPaginatedList = null;
	private int subGridCountValue = 0;

	private int subGridCurrPaginationIndex = 0;
	private String subGridCurrSortDirection ;
	private String subGridCurrSortCriteria ;
	private Integer subGridbackupUserId = 0;
	private String nestedSortCriteria;

	
	Map<String, Object> logicalOperatorMap = new LinkedHashMap<>();
	
	List  subGridDbData = new ArrayList();
	
	private int  subGridDbCount = 0;
	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public Integer getNumberOfRecordsCreated() {
		return numberOfRecordsCreated;
	}
	public void setNumberOfRecordsCreated(Integer numberOfRecordsCreated) {
		this.numberOfRecordsCreated = numberOfRecordsCreated;
	}
	public Integer getSubGridUserId() {
		return subGridUserId;
	}
	public void setSubGridUserId(Integer subGridUserId) {
		this.subGridUserId = subGridUserId;
	}
	public Integer getSubGridRequestPage() {
		return subGridRequestPage;
	}
	public void setSubGridRequestPage(Integer subGridRequestPage) {
		this.subGridRequestPage = subGridRequestPage;
	}
	
	public String getSubGridSortCriteria() {
		return subGridSortCriteria;
	}
	public void setSubGridSortCriteria(String subGridSortCriteria) {
		this.subGridSortCriteria = subGridSortCriteria;
	}
	
	public int getSubGridCountValue() {
		return subGridCountValue;
	}
	public void setSubGridCountValue(int subGridCountValue) {
		this.subGridCountValue = subGridCountValue;
	}
	public int getSubGridCurrPaginationIndex() {
		return subGridCurrPaginationIndex;
	}
	public void setSubGridCurrPaginationIndex(int subGridCurrPaginationIndex) {
		this.subGridCurrPaginationIndex = subGridCurrPaginationIndex;
	}
	public String getSubGridCurrSortDirection() {
		return subGridCurrSortDirection;
	}
	public void setSubGridCurrSortDirection(String subGridCurrSortDirection) {
		this.subGridCurrSortDirection = subGridCurrSortDirection;
	}
	public String getSubGridCurrSortCriteria() {
		return subGridCurrSortCriteria;
	}
	public void setSubGridCurrSortCriteria(String subGridCurrSortCriteria) {
		this.subGridCurrSortCriteria = subGridCurrSortCriteria;
	}
	public Integer getSubGridbackupUserId() {
		return subGridbackupUserId;
	}
	public void setSubGridbackupUserId(Integer subGridbackupUserId) {
		this.subGridbackupUserId = subGridbackupUserId;
	}
	public IExtendedPaginatedList getSubGridPaginatedList() {
		return subGridPaginatedList;
	}
	public void setSubGridPaginatedList(IExtendedPaginatedList subGridPaginatedList) {
		this.subGridPaginatedList = subGridPaginatedList;
	}
	public String getSubGridSortDirection() {
		return subGridSortDirection;
	}
	public void setSubGridSortDirection(String subGridSortDirection) {
		this.subGridSortDirection = subGridSortDirection;
	}
	public Map<String, Object> getLogicalOperatorMap() {
		return logicalOperatorMap;
	}
	public void setLogicalOperatorMap(Map<String, Object> logicalOperatorMap) {
		this.logicalOperatorMap = logicalOperatorMap;
	}

	public String getNestedSortCriteria() {
		return nestedSortCriteria;
	}
	public void setNestedSortCriteria(String nestedSortCriteria) {
		this.nestedSortCriteria = nestedSortCriteria;
	}
	public List getSubGridDbData() {
		return subGridDbData;
	}
	public void setSubGridDbData(List subGridDbData) {
		this.subGridDbData = subGridDbData;
	}
	public int getSubGridDbCount() {
		return subGridDbCount;
	}
	public void setSubGridDbCount(int subGridDbCount) {
		this.subGridDbCount = subGridDbCount;
	}
	
	
}
