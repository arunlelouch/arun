package com.chegus.geni.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommonServiceImpl<E, ID extends Serializable> implements CommonService<E, ID>
{
	@Autowired
	CommonDAO<E, ID> commonDAO;

	@Transactional
	@Override
	public List<Object> commonSearch(Object objectDO, Map<String, Object> map,String listMethodName,String paramName, String order) 
	{
		return commonDAO.commonSearch(objectDO, map, listMethodName, paramName, order);
	}

	@Transactional
	@Override
	public Integer commonCount(Object objectDO, Map<String, Object> logicalOperatorMap)
	{
		return commonDAO.commonCount(objectDO, logicalOperatorMap);
	}
}