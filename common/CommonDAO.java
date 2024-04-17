package com.chegus.geni.common;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.chegus.geni.domain.AccessListDO;
import com.chegus.geni.domain.ModuleDO;

@SuppressWarnings("hiding")
public interface CommonDAO<E, ID>
{
	public abstract ID save(E entity);
	public abstract void saveOrUpdate(E entity);
	public abstract void update(E entity);
	public abstract void delete(E entity);
	public abstract void deleteById(ID key,Class<? extends E> entityClass);
	public abstract E getById(ID key,Class<? extends E> entityClass);
	public abstract List<E> list(Class<? extends E> entityClass);
	public abstract Object callstoredfunction(String sql);
	public List<Object> commonSearch(Object objectDO,Map<String, Object> logicalOperatorMap, String listMethodName,String paramName, String order);
	public  <T> List<T> commonAssociationSearch(T t,List<T> list,String listName,String fieldName,String order ) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException, SecurityException, NoSuchFieldException;
	public Integer commonCount(Object objectDO, Map<String, Object> logicalOperatorMap);
	public List<Object> commonSearchForView(Object objectDO, Map<String, String> logicalOperatorMap,String viewName) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException, SQLException;
	Object commonMaxOrMin(Object objectDO, Map<String, Object> logicalOperatorMap, String field, String maxOrMin);

	public List<ModuleDO> getModuleList();
	public List<AccessListDO> getAccessList();
}