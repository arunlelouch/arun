package com.chegus.geni.common;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chegus.geni.pagination.IExtendedPaginatedList;

@SuppressWarnings("rawtypes")
public class MainGridData {

	private Integer numberOfRecordsCreated = 0;
	
	private int mainGridCountValue = 0;
	private int mainGridCurrPaginationIndex = 0;
	private String mainGridCurrSortDirection;
													
	private String mainGridCurrSortCriteria ;
	private IExtendedPaginatedList mainGridPaginatedList = null;
	private String mainGridSortDirection ;
	private String mainGridSortCriteria ;
	private Integer mainGridRequestPage = 0;
	Map<String, Object> logicalOperatorMap = new LinkedHashMap<>();

	
	List mainGridDbData = new ArrayList();
	
	private int mainGridDbCount = 0;
	

	public Integer getNumberOfRecordsCreated() {
		return numberOfRecordsCreated;
	}
	public void setNumberOfRecordsCreated(Integer numberOfRecordsCreated) {
		this.numberOfRecordsCreated = numberOfRecordsCreated;
	}
	public int getMainGridCountValue() {
		return mainGridCountValue;
	}
	public void setMainGridCountValue(int mainGridCountValue) {
		this.mainGridCountValue = mainGridCountValue;
	}
	public int getMainGridCurrPaginationIndex() {
		return mainGridCurrPaginationIndex;
	}
	public void setMainGridCurrPaginationIndex(int mainGridCurrPaginationIndex) {
		this.mainGridCurrPaginationIndex = mainGridCurrPaginationIndex;
	}
	public String getMainGridCurrSortDirection() {
		return mainGridCurrSortDirection;
	}
	public void setMainGridCurrSortDirection(String mainGridCurrSortDirection) {
		this.mainGridCurrSortDirection = mainGridCurrSortDirection;
	}
	public String getMainGridCurrSortCriteria() {
		return mainGridCurrSortCriteria;
	}
	public void setMainGridCurrSortCriteria(String mainGridCurrSortCriteria) {
		this.mainGridCurrSortCriteria = mainGridCurrSortCriteria;
	}
	public IExtendedPaginatedList getMainGridPaginatedList() {
		return mainGridPaginatedList;
	}
	public void setMainGridPaginatedList(
			IExtendedPaginatedList mainGridPaginatedList) {
		this.mainGridPaginatedList = mainGridPaginatedList;
	}
	public String getMainGridSortDirection() {
		return mainGridSortDirection;
	}
	public void setMainGridSortDirection(String mainGridSortDirection) {
		this.mainGridSortDirection = mainGridSortDirection;
	}
	public String getMainGridSortCriteria() {
		return mainGridSortCriteria;
	}
	public void setMainGridSortCriteria(String mainGridSortCriteria) {
		this.mainGridSortCriteria = mainGridSortCriteria;
	}
	public Integer getMainGridRequestPage() {
		return mainGridRequestPage;
	}
	public void setMainGridRequestPage(Integer mainGridRequestPage) {
		
		this.mainGridRequestPage = mainGridRequestPage;
	}
	public Map<String, Object> getLogicalOperatorMap() {
		return logicalOperatorMap;
	}
	public void setLogicalOperatorMap(Map<String, Object> logicalOperatorMap) {
		this.logicalOperatorMap = logicalOperatorMap;
	}
	public List getMainGridDbData() {
		return mainGridDbData;
	}
	public void setMainGridDbData(List mainGridDbData) {
		this.mainGridDbData = mainGridDbData;
	}
	public int getMainGridDbCount() {
		return mainGridDbCount;
	}
	public void setMainGridDbCount(int mainGridDbCount) {
		this.mainGridDbCount = mainGridDbCount;
	}

}
