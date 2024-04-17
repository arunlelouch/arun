package com.chegus.geni.common;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.chegus.geni.domain.AccessListDO;
import com.chegus.geni.domain.ModuleDO;
//import com.chegus.geni.domain.UserNotificationDO;---- COMMON_ALERT_NOTIFICATION
import com.chegus.geni.util.ApplicationConstants;
import com.chegus.geni.util.CheckConditionUtil;
import com.chegus.geni.util.LoggerUtil;
import com.chegus.geni.util.ReflectionUtil;
import com.chegus.geni.util.SessionUtil;

@Primary 
@Repository
@SuppressWarnings({ "unchecked","rawtypes","finally"})
public class CommonDAOImpl<E, ID extends Serializable> implements CommonDAO<E, ID>
{
	public SessionFactory sessionFactory;

	private static final String SEPARATOR = ".";
	private static final String BETWEENSEPARATOR = "$";

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	protected Session currentSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public  void update(E entity)
	{
		try
		{
			CheckConditionUtil.CheckEmptyStrngOfObj(entity);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			currentSession().update(entity);
		}
	}

	@Override
	public ID save(E entity)
	{
		try
		{
			CheckConditionUtil.CheckEmptyStrngOfObj(entity);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally 
		{
			return (ID) currentSession().save(entity);
		}
	}

	@Override
	public void saveOrUpdate(E entity)
	{
		try
		{
			CheckConditionUtil.CheckEmptyStrngOfObj(entity);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally 
		{
			currentSession().saveOrUpdate(entity);
		}
	}

	@Override
	public void delete(E entity)
	{
		currentSession().delete(entity);
	}

	@Override
	public void deleteById(ID key, Class<? extends E> entityClass)
	{
		E entity = getById(key, entityClass);
		if (null != entity)
		{
			delete(entity);
		}
	}

	@Override
	public E getById(ID key, Class<? extends E> entityClass)
	{
		return (E) currentSession().get(entityClass, key);
	}

	@Override
	public List<E> list(Class<? extends E> entityClass)
	{
		CriteriaQuery criteria = currentSession().getCriteriaBuilder().createQuery(entityClass);
		Root<Object> personRoot = criteria.from( entityClass );
		criteria.select( personRoot );
		return currentSession().createQuery(criteria).getResultList();

	}

	/*
	 * @Override
	 * 
	 * @SuppressWarnings({"hiding"}) public final <E extends Entity<ID>, ID> Map<ID,
	 * E> getByIds(Set<ID> hashSet, Class<? extends E> entityClass) { final Map<ID,
	 * E> map = new HashMap<ID, E>(); if (hashSet.isEmpty()) { return
	 * Collections.EMPTY_MAP; } else { Criteria criteria =
	 * currentSession().createCriteria(entityClass);
	 * criteria.add(Restrictions.in("id", hashSet)); final List<E> list =
	 * criteria.list();
	 * 
	 * for (E result : list) { map.put(result.getId(), result); } return map; } }
	 */

	/**
	 * This method creates the query to select the values from the db. For
	 * nested properties pass the values in hashmap with dot(.) separation
	 * 
	 * 
	 * selectHQL(Object objectDO, HashMap<String, String> logicalOperatorMap,
	 * String listMethodName, String paramName, String order)
	 * 
	 * It takes five arguments one is object and another one is hash map. Object
	 * takes persistence domain object and hashmap accepts two strings, one for
	 * parameter of domain object and another one is condition(eg. clike, elike,
	 * slike, eq, gt).
	 * 
	 * listMethodName argument is list field name.
	 * 
	 * paramName argument is parameter name in list object.
	 * 
	 * order argument is asc or desc order for list of objects.
	 * 
	 * If list is not there in your requirement, pass null
	 * 
	 * @author C Narasimha Reddy
	 */
	@Override
	public List<Object> commonSearch(Object objectDO, Map<String, Object> logicalOperatorMap, String listMethodName, String paramName, String order)
	{
		List<Object> listObjects = new ArrayList<Object>();
		Criteria criteria = null;
		criteria = getCriteriaWithAlias(objectDO, criteria, logicalOperatorMap);
		listObjects = criteria.list();
		if (CheckConditionUtil.checkNotNull(order) && CheckConditionUtil.checkNotNull(paramName))
		{
			listObjects = commonAssociationSearch(objectDO, listObjects, listMethodName, paramName, order);
		}
		return listObjects;
	}

	@Override
	public <T> List<T> commonAssociationSearch(T t, List<T> list, String listName, String fieldName, String order)
	{
		List tempList = new ArrayList();
		try
		{
			t = ReflectionUtil.getValue(list.get(0), listName);
		} 
		catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException e)
		{
			e.printStackTrace();
		}
		tempList = currentSession().createFilter(t, "Order by" + " " + fieldName + " " + order).list();
		return tempList;
	}

	public Criteria mainQueryCriteria(Object objectDO, Criteria criteria,List repeatedValue ,Map.Entry mapEntry, String keyValue, Map<String, Object> logicalOperatorMap )
	{
		String logicalObjects[] =  new String[3];
		Integer logicalObjectsLength = 0 ;
		String betweenValues[] = null;
		Object toValue = null;
		Object getVal = objectDO;

		baseAlias =  "parentObjectAlias";
		if(keyValue.contains(BETWEENSEPARATOR))
		{
			betweenValues = keyValue.split("\\" + BETWEENSEPARATOR);
			keyValue = betweenValues[0];
			List searchvalue = new ArrayList<>();
			searchvalue = getSearchValue(betweenValues[1], getVal, logicalObjects, logicalObjectsLength);
			toValue = searchvalue.get(0);
			searchvalue = getSearchValue(betweenValues[0], getVal, logicalObjects, logicalObjectsLength);
			getVal = searchvalue.get(0);
			logicalObjects = (String[]) searchvalue.get(1);
			logicalObjectsLength = (Integer) searchvalue.get(2);
		}
		else
		{
			List searchvalue = new ArrayList<>();
			searchvalue = getSearchValue(keyValue, getVal, logicalObjects, logicalObjectsLength);
			getVal = searchvalue.get(0);
			logicalObjects = (String[]) searchvalue.get(1);
			logicalObjectsLength = (Integer) searchvalue.get(2);
		}
		String copyKeyValue = keyValue;
		String value = (String) mapEntry.getValue();
		if(copyKeyValue.equalsIgnoreCase("asc")  || copyKeyValue.equalsIgnoreCase("desc"))
		{
			String temp = copyKeyValue;
			copyKeyValue = value;
			value = temp;
		}

		boolean repeatValueCheck = false;
		/*We should not create alias everytime for child object everytime.This code is  to get already created alias    and to check in repeatedValue list added by manjunath */
		if(CheckConditionUtil.checkListNotNull(repeatedValue) && (logicalObjectsLength >= 2 ||  copyKeyValue.contains(SEPARATOR)) )
		{
			if(logicalObjectsLength >= 2)
			{
				repeatValueCheck = repeatedValue.get(repeatedValue.size()-1).toString().equalsIgnoreCase(logicalObjects[logicalObjectsLength-2]);
				if(copyKeyValue.contains(SEPARATOR) && !repeatValueCheck )
				{
					String checkforduplicatealias=copyKeyValue.substring(0, copyKeyValue.indexOf(SEPARATOR)+1);
					repeatValueCheck=repeatedValue.contains(checkforduplicatealias);
				}
			}
			else
			{
				if(copyKeyValue.contains(SEPARATOR))
				{
					String checkforduplicatealias=copyKeyValue.substring(0, copyKeyValue.lastIndexOf(SEPARATOR));
					repeatValueCheck=repeatedValue.contains(checkforduplicatealias);
				}
			}
		}

		if(logicalObjectsLength >= 2)
			repeatedValue.add(logicalObjects[logicalObjects.length-2]);

		String fieldName = null;
		if(!copyKeyValue.equalsIgnoreCase("firstResult") && !copyKeyValue.equalsIgnoreCase("maxResult")  /*&& !copyKeyValue.equalsIgnoreCase("asc")  && !copyKeyValue.equalsIgnoreCase("desc")*/ && copyKeyValue.contains(SEPARATOR) && !repeatValueCheck)
		{
			fieldName = copyKeyValue.substring(copyKeyValue.lastIndexOf(".")+1);
			/*String nstedObjectsToCreateCriteria = copyKeyValue.substring(0,copyKeyValue.lastIndexOf("."));
			String[] nestedCriteriaObjects = nstedObjectsToCreateCriteria.split("\\" + SEPARATOR);
			String lastCretedCriteriaObjectsAlias = new String();
			lastCretedCriteriaObjectsAlias = baseAlias;

			for(String criteriaObject : nestedCriteriaObjects)
			{
				criteria.createAlias(lastCretedCriteriaObjectsAlias+"."+criteriaObject, criteriaObject);
				lastCretedCriteriaObjectsAlias=criteriaObject;
				repeatedValue.add(criteriaObject);
			}
			 */
			fieldName = copyKeyValue.substring(copyKeyValue.lastIndexOf(".")+1);
			criteria.createAlias(baseAlias+"."+copyKeyValue.substring(0,copyKeyValue.lastIndexOf(".")), getAlias(copyKeyValue, baseAlias));
			repeatedValue.add( getAlias(copyKeyValue, baseAlias));
		}
		else
		{
			if(copyKeyValue.contains("."))
			{
				fieldName = copyKeyValue.substring(copyKeyValue.lastIndexOf(".")+1);
			}
			else
				fieldName = copyKeyValue;
		}
		criteria = (Criteria) getSwitchCase(criteria, value, copyKeyValue, baseAlias, getVal, fieldName, toValue,null).get(0);
		return criteria;
	}
	public Criteria getSubQueryCriteria(Object objectDO, Criteria criteria, Map<String, Object> logicalOperatorMap )
	{
		DetachedCriteria detachedCriteria;
		String mainQueryCondition = null;
		String mainQueryField= null;
		if (logicalOperatorMap != null)
		{
			if(logicalOperatorMap.containsKey("subqueryObject"))
			{
				Class c = (Class) logicalOperatorMap.get("subqueryObject");
				detachedCriteria = DetachedCriteria.forClass(c, "subQueryAlias"); 
			}
			else
				detachedCriteria =	 DetachedCriteria.forClass(objectDO.getClass(), "subQueryAlias"); 

			if(logicalOperatorMap.containsKey(ApplicationConstants.AGGR_MAX))
			{
				mainQueryField = (String) logicalOperatorMap.get(ApplicationConstants.AGGR_MAX);
				String subQueryAggField = mainQueryField.substring(mainQueryField.lastIndexOf(".")+1);
				detachedCriteria.setProjection(Projections.max(detachedCriteria.getAlias()+"."+subQueryAggField));
			}
			if(logicalOperatorMap.containsKey(ApplicationConstants.AGGR_PROP))
			{
				Map m = (Map) logicalOperatorMap.get(ApplicationConstants.AGGR_PROP);
				String parentField = (String) m.values().iterator().next();

				detachedCriteria.add(Restrictions.eqProperty(detachedCriteria.getAlias()+"."+m.keySet().iterator().next(),getAlias(parentField, baseAlias)+"."+parentField.substring(parentField.indexOf(".")+1)));
			}

			if(logicalOperatorMap.containsKey(ApplicationConstants.AGGR_COND))
			{
				mainQueryCondition = (String) logicalOperatorMap.get(ApplicationConstants.AGGR_COND);
			}
			Map<String, Object> logicalOperatorMapForWhereCondition = new HashMap<>();
			Set mapSet = logicalOperatorMap.entrySet();
			Iterator mapIterator = mapSet.iterator();
			while(mapIterator.hasNext())
			{
				Map.Entry mapEntry = (Map.Entry) mapIterator.next();
				if(!(mapEntry.getKey().equals(ApplicationConstants.AGGR_MAX) || mapEntry.getKey().equals(ApplicationConstants.AGGR_PROP) || mapEntry.getKey().equals(ApplicationConstants.AGGR_COND) || mapEntry.getKey().equals("subqueryObject") ) )
				{
					String keyValue = (String) mapEntry.getKey();
					String value = (String) mapEntry.getValue();
					logicalOperatorMapForWhereCondition.put(keyValue, value);
				}
			}
			Set mapSetForWhereCondition = logicalOperatorMapForWhereCondition.entrySet();
			Iterator mapIteratorForWhereCondition = mapSetForWhereCondition.iterator();

			while (mapIteratorForWhereCondition.hasNext() /*&& !(logicalOperatorMap.containsKey(ApplicationConstants.AGGR_MAX) || logicalOperatorMap.containsKey(ApplicationConstants.AGGR_PROP) || logicalOperatorMap.containsKey(ApplicationConstants.AGGR_COND)) */)
			{				
				Object getVal = objectDO;
				Map.Entry mapEntry = (Map.Entry) mapIteratorForWhereCondition.next();
				String keyValue = (String) mapEntry.getKey();
				String value = (String) mapEntry.getValue();

				String logicalObject[] = new String[3];
				List returnSearchVal = getSearchValue(keyValue, getVal, logicalObject, null);
				getVal = returnSearchVal.get(0);
				String[] fieldNames = (String[]) returnSearchVal.get(1);
				String fieldName = fieldNames[0];
				detachedCriteria  = (DetachedCriteria) getSwitchCase(criteria, value, null, baseAlias, getVal, fieldName, null,detachedCriteria).get(0);
			}
			switch(mainQueryCondition)
			{
			case ApplicationConstants.EQUAL:
				criteria.add(Property.forName(getAlias(mainQueryField, baseAlias)+"."+mainQueryField.substring(mainQueryField.indexOf(".")+1)).eq(detachedCriteria));
				break;
			}
		}
		return criteria;
	}

	String baseAlias = "parentObjectAlias";
	public Criteria getCriteriaWithAlias(Object objectDO, Criteria criteria, Map<String, Object> logicalOperatorMap )
	{
		// Adding Branch preference
		try
		{
			String locIdField = CommonMessageSource.getMessage(ApplicationConstants.BRANCH_PREFERENCE+SEPARATOR+objectDO.getClass().getSimpleName());
			if(CheckConditionUtil.checkNotNull(locIdField))
			{
				setLocationIds(objectDO, locIdField, logicalOperatorMap);
			}
		}
		catch(Exception exp)
		{
			// Do Nothing			
		}
		finally
		{
			if((null != logicalOperatorMap) && (logicalOperatorMap.containsKey(ApplicationConstants.BRANCH_PREFERENCE_KEY)))
			{
				logicalOperatorMap.remove(ApplicationConstants.BRANCH_PREFERENCE_KEY);
			}
		}

		List repeatedValue = new ArrayList<>();
		criteria = currentSession().createCriteria(objectDO.getClass(),baseAlias);
		if (logicalOperatorMap != null)
		{
			Set mapSet = logicalOperatorMap.entrySet();
			Iterator mapIterator = mapSet.iterator();
			while (mapIterator.hasNext())
			{
				Map.Entry mapEntry = (Map.Entry) mapIterator.next();
				String keyValue = (String) mapEntry.getKey();
				if(ApplicationConstants.SUB_QUERY.equalsIgnoreCase(keyValue))
				{
					Map<String, Object> subQueryLogicalOperMap = new LinkedHashMap();
					subQueryLogicalOperMap = (Map<String, Object>) mapEntry.getValue();

					criteria = getSubQueryCriteria(objectDO, criteria, subQueryLogicalOperMap);
				}
				else if(ApplicationConstants.SELECT_COLUMNS.equals(keyValue))
				{
					HashSet<String> columns =  (HashSet<String>) mapEntry.getValue();
					ProjectionList projectionList = Projections.projectionList();

					for(String column : columns)
					{
						if(column.contains(SEPARATOR))
						{

							String checkforduplicatealias = column.substring(0, column.lastIndexOf(SEPARATOR));
							if(!repeatedValue.contains(checkforduplicatealias))
							{
								criteria.createAlias(baseAlias+"."+checkforduplicatealias, getAlias(column, baseAlias));
								repeatedValue.add( getAlias(column, baseAlias));
							}

							projectionList.add(Projections.property(getAlias(column, baseAlias)+"."+column.substring(column.lastIndexOf(".")+1)),column);
						}
						else
						{
							projectionList.add(Projections.property(column),column);
						}						
					}
					criteria.setProjection(projectionList);
//					criteria.setResultTransformer(Transformers.aliasToBean(objectDO.getClass()));
					criteria.setResultTransformer(new CustomAliasToBeanTransformer(objectDO.getClass()));
				}
				else
				{
					criteria = mainQueryCriteria(objectDO, criteria,  repeatedValue,  mapEntry, keyValue, logicalOperatorMap);
				}
			}
		}
		return criteria;
	}

	public List getSwitchCase(Criteria criteria,String value,String copyKeyValue,String baseAlias,Object getVal,String fieldName,Object toValue,DetachedCriteria detachedCriteria  )
	{
		List criteriaOrDetachedCriteria = new ArrayList<>();
		switch (value)
		{
		case ApplicationConstants.CLIKE:
			criteria.add(Restrictions.like(getAlias(copyKeyValue, baseAlias)+"."+fieldName, "%"+getVal+"%").ignoreCase());
			break;

		case ApplicationConstants.ELIKE:
			criteria.add(Restrictions.like(getAlias(copyKeyValue, baseAlias)+"."+fieldName, "%"+getVal).ignoreCase());
			break;

		case ApplicationConstants.SLIKE:
			criteria.add(Restrictions.like(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal+"%").ignoreCase());
			break;

		case ApplicationConstants.BETWEEN:
			criteria.add(Restrictions.between(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal,toValue));
			break;

		case ApplicationConstants.EQUAL:
			if(detachedCriteria != null)
				detachedCriteria.add(Restrictions.eq(fieldName, getVal));
			else if (getVal instanceof CharSequence)
			{
				criteria.add(Restrictions.eq(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal).ignoreCase());
			}
			else
			{
				criteria.add(Restrictions.eq(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal));
			}
			break;

		case ApplicationConstants.NOTEQUAL:

			if (getVal instanceof CharSequence)
			{
				criteria.add(Restrictions.ne(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal).ignoreCase());
			}
			else
			{
				criteria.add(Restrictions.ne(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal));
			}
			break;

		case ApplicationConstants.NOTIN:
			Object[] inObjects = getVal.toString().split(",");
			criteria.add(Restrictions.not(Restrictions.in(getAlias(copyKeyValue, baseAlias)+"."+fieldName, inObjects)));
			break;

		case ApplicationConstants.IN:
			if(fieldName.equalsIgnoreCase("branchLogin_IdList"))
			{	  	
				criteria.add(Restrictions.in(getAlias(copyKeyValue, baseAlias)+".branchLogin_ID", (List<Integer>) getVal));
			}
			else
			{
				String[] inObjects1 = getVal.toString().split(",");
				criteria.add(Restrictions.in(getAlias(copyKeyValue, baseAlias)+"."+fieldName, inObjects1));	
			}		
			break;

		case ApplicationConstants.ISNOTNULL:
			criteria.add(Restrictions.isNotNull(getAlias(copyKeyValue, baseAlias)+"."+fieldName));
			break;

		case ApplicationConstants.ISNULL:
			criteria.add(Restrictions.isNull(getAlias(copyKeyValue, baseAlias)+"."+fieldName));
			break;	

		case ApplicationConstants.LESSTHANEQUAL:
			if(detachedCriteria != null)
				detachedCriteria.add(Restrictions.le(fieldName, getVal));
			else
				criteria.add(Restrictions.le(fieldName, getVal));
			break;
			
		case ApplicationConstants.LESSTHAN:
			if(detachedCriteria != null)
				detachedCriteria.add(Restrictions.le(fieldName, getVal));
			else
				criteria.add(Restrictions.lt(fieldName, getVal));
			break;

		case ApplicationConstants.GREATERTHANEQUAL:
			if(detachedCriteria != null)
				detachedCriteria.add(Restrictions.ge(fieldName, getVal));
			else
				criteria.add(Restrictions.ge(fieldName, getVal));
			break;

		case ApplicationConstants.GREATERTHAN:
			criteria.add(Restrictions.gt(getAlias(copyKeyValue, baseAlias)+"."+fieldName, getVal));
			break;

		case ApplicationConstants.GREATERTHANEQUALorISNULL:
			criteria.add(Restrictions.or(Restrictions.ge(fieldName, getVal),Restrictions.isNull(getAlias(copyKeyValue, baseAlias)+"."+fieldName)));
			break;
		}

		if (ApplicationConstants.ASCENDING.equalsIgnoreCase(value))
		{
			if(copyKeyValue.contains("."))
			{
				criteria.addOrder(Order.asc(getAlias(copyKeyValue, baseAlias)+"."+fieldName));
			}
			else
			{
				criteria.addOrder(Order.asc(getAlias(copyKeyValue, baseAlias)+"."+fieldName));
			}
		} 
		else if(ApplicationConstants.DESCENDING.equalsIgnoreCase(value))
		{
			if(copyKeyValue.contains("."))
			{
				criteria.addOrder(Order.desc(getAlias(copyKeyValue, baseAlias)+"."+fieldName));
			}
			else 
			{
				criteria.addOrder(Order.desc(getAlias(copyKeyValue, baseAlias)+"."+fieldName));
			}
		}

		if (ApplicationConstants.FIRSTRESULT.equalsIgnoreCase(fieldName))
		{
			Integer firstResult = Integer.parseInt(value);
			criteria.setFirstResult(firstResult);
		}

		if (ApplicationConstants.MAXRESULT.equalsIgnoreCase(fieldName))
		{
			Integer maxResult = Integer.parseInt(value);
			criteria.setMaxResults(maxResult);
		}
		if (ApplicationConstants.MAXIMUM.equalsIgnoreCase(fieldName))
		{
			criteria.setProjection(Projections.max(value));
		}

		if (ApplicationConstants.DISTINCT.equalsIgnoreCase(fieldName))
		{
			criteria.setProjection(Projections.distinct(Projections.property(value)));
		}
		if(detachedCriteria != null)
			criteriaOrDetachedCriteria.add(0, detachedCriteria);
		else
			criteriaOrDetachedCriteria.add(0, criteria);

		return criteriaOrDetachedCriteria;
	}

	private static void setLocationIds(Object object,String locationIdField,Map logicalMap)
	{
		try
		{
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			HttpSession httpSession = SessionUtil.getSession(request);

			if((null != httpSession.getAttribute(ApplicationConstants.USER_OPTED_LOCATIONS)) &&
					(("true".equalsIgnoreCase(request.getParameter(ApplicationConstants.BRANCH_PREFERENCE_KEY))) || ("true".equalsIgnoreCase((String)logicalMap.get(ApplicationConstants.BRANCH_PREFERENCE_KEY)))))
			{
				List<Integer> locations=(ArrayList<Integer>) httpSession.getAttribute(ApplicationConstants.USER_OPTED_LOCATIONS);
				ReflectionUtil.setValue(object, locationIdField, locations);
				logicalMap.put(locationIdField, ApplicationConstants.IN);
				//logicalMap.remove(ApplicationConstants.BRANCH_PREFERENCE_KEY);
			}
		}
		catch(Exception exp)
		{
			LoggerUtil.getLogger().debug("Exception occured while setting up the Location Ids in common Search : ",exp);
		}		
	}

	public String getAlias(String copyKeyValue,String baseAlias)
	{
		String logicalObjects[] = null ;
		if (copyKeyValue.contains(SEPARATOR))
		{
			logicalObjects = copyKeyValue.split("\\" + SEPARATOR);
			return logicalObjects[logicalObjects.length-2];
		}
		else 
		{
			return baseAlias;
		}
	}

	private static Set<String> checkConditions = null;

	public List getSearchValue(String keyValue, Object getVal, String logicalObjects[], Integer logicalObjectsLength)
	{
		List listObject = new ArrayList<>();

		if(checkConditions == null)
		{
			checkConditions = new HashSet<String>();
			checkConditions.add(ApplicationConstants.FIRSTRESULT);
			checkConditions.add(ApplicationConstants.MAXRESULT);
			checkConditions.add(ApplicationConstants.ASCENDING);
			checkConditions.add(ApplicationConstants.DESCENDING);
			checkConditions.add(ApplicationConstants.DISTINCT);
		}

		if (keyValue.contains(SEPARATOR)) 
		{
			logicalObjects = keyValue.split("\\" + SEPARATOR);
			logicalObjectsLength = logicalObjects.length;
			try 
			{
				//To avoid exceptions added by manjunath
				if(!checkConditions.contains(keyValue))
				{
					getVal = ReflectionUtil.getValue(getVal, keyValue);
				}
			} 
			catch (InvocationTargetException | IllegalAccessException| NoSuchMethodException e)
			{
				LoggerUtil.getLogger().debug("Error while getting value from reflection : ",e);
			}
		} 
		else
		{
			try 
			{
				//To avoid exceptions added by manjunath
				if(!checkConditions.contains(keyValue))
				{
					getVal = ReflectionUtil.getValue(getVal, keyValue);
				}
				logicalObjects[0]=keyValue;
			}
			catch (InvocationTargetException | IllegalAccessException| NoSuchMethodException e) 
			{
				LoggerUtil.getLogger().debug("Error while getting value from reflection : ",e);
			}
		}
		listObject.add(0,getVal);
		listObject.add(1,logicalObjects);
		listObject.add(2,logicalObjectsLength);
		return listObject;
	}

	@Override
	public Integer commonCount(Object objectDO, Map<String, Object> logicalOperatorMap)
	{
		Criteria criteria = null;
		criteria = getCriteriaWithAlias(objectDO, criteria, logicalOperatorMap);
		Long rowCount = (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();

		return rowCount.intValue();
	}

	@Override
	public Object commonMaxOrMin(Object objectDO, Map<String, Object> logicalOperatorMap,String field,String maxOrMin)
	{
		Criteria criteria = null;
		Object maxOrMinObject = new Object();
		criteria = getCriteriaWithAlias(objectDO, criteria, logicalOperatorMap);

		if(maxOrMin.equalsIgnoreCase(ApplicationConstants.MAXIMUM))
			maxOrMinObject = criteria.setProjection(Projections.max(field)).uniqueResult();
		if(maxOrMin.equalsIgnoreCase(ApplicationConstants.MINIMUM))
			maxOrMinObject = criteria.setProjection(Projections.min(field)).uniqueResult();

		return maxOrMinObject;
	}

	@Override
	public Object callstoredfunction(String sql) 
	{
		SQLQuery query = currentSession().createSQLQuery(sql);
		return query.uniqueResult();
	}

	@Override
	public List<Object> commonSearchForView(Object objectDO, Map<String, String> logicalOperatorMap,String viewName) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException, SQLException
	{
		QueryBuilder queryBuilder = new QueryBuilder();
		StringBuilder stringBuilder = queryBuilder.getSelectQuery(objectDO,  logicalOperatorMap,viewName);
		List listObjects = currentSession().createSQLQuery(stringBuilder.toString()).addEntity(objectDO.getClass()).list();
		return listObjects;

	}
	
	@Override
	public List<AccessListDO> getAccessList() {
		return sessionFactory.getCurrentSession().createCriteria(AccessListDO.class).list();
	}
	
	@Override
	public List<ModuleDO> getModuleList() {
		return getModuleListData(); 
	}
	
	private List<ModuleDO> getModuleListData() 
	{
		List<ModuleDO> moduleDOs =  sessionFactory.getCurrentSession().createCriteria(ModuleDO.class).list();
		
		for (ModuleDO moduleDO : moduleDOs) 
		{
			Hibernate.initialize(((ModuleDO)moduleDO).getModuleFtrDOList());
		}

		return moduleDOs;
	}
}