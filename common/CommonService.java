package com.chegus.geni.common;

import java.util.List;
import java.util.Map;

public interface CommonService<E, ID>
{
	public List<Object> commonSearch(Object objectDO, Map<String, Object> logicalOperatorMap,String listMethodName,String paramName, String order );
	public Integer commonCount(Object objectDO, Map<String, Object> logicalOperatorMap);
}