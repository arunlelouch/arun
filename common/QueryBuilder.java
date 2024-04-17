package com.chegus.geni.common;

	import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.chegus.geni.util.ApplicationConstants;
import com.chegus.geni.util.CheckConditionUtil;
import com.chegus.geni.util.ReflectionUtil;

	public class QueryBuilder {
	
		
	 
		public boolean containsKeyValue(String keyValue)
		{			
			
			if(keyValue.equalsIgnoreCase(ApplicationConstants.FIRSTRESULT) || keyValue.equalsIgnoreCase(ApplicationConstants.MAXRESULT) || keyValue.equalsIgnoreCase(ApplicationConstants.ASCENDING) || keyValue.equalsIgnoreCase(ApplicationConstants.DESCENDING))
			{
				return true;
			}
			else
				return false;
			
		 }
		public StringBuilder getSelectQuery(Object objectDO,Map<String, String> logicalOperatorMap,String viewName) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException, SQLException
		 {
	
			String sortCriteria = "(SELECT 0 )";
			String sortDirection = ApplicationConstants.ASCENDING;
			
			if(logicalOperatorMap.containsKey(ApplicationConstants.ASCENDING) )
			{
				sortDirection = ApplicationConstants.ASCENDING;
				sortCriteria = logicalOperatorMap.get(ApplicationConstants.ASCENDING);
			}
			if(logicalOperatorMap.containsKey(ApplicationConstants.DESCENDING))
			{
				sortDirection = ApplicationConstants.DESCENDING;
				sortCriteria = logicalOperatorMap.get(ApplicationConstants.DESCENDING);

			}
			
			
			
			String view = objectDO.getClass().toString().substring(objectDO.getClass().toString().lastIndexOf(".")+1 );
			String view1 ;
			if(	CheckConditionUtil.checkNotNull(viewName))
				view1 = viewName;
				else
				view1= view.substring(0,view.indexOf("DO"));
			StringBuilder stringBuilder = new StringBuilder("SELECT ROW_NUMBER() OVER (ORDER BY "+sortCriteria.toUpperCase()+" "+ sortDirection.toUpperCase() +" ) AS MyRowNumber,"+view1.toUpperCase()+".* FROM "+view1.toUpperCase()+" "+view1.toUpperCase());
			Object getVal = null;
			String firstResult = null;
			String maxResult = null;
			/*if((logicalOperatorMap.size() == 2 && logicalOperatorMap.containsKey(ApplicationConstants.FIRSTRESULT) && logicalOperatorMap.containsKey(ApplicationConstants.MAXRESULT)))
			{
				
			}*/
			if (logicalOperatorMap != null  )
			{
			boolean isContinue = false;
				if(!logicalOperatorMap.isEmpty() && !(logicalOperatorMap.size() == 2 && logicalOperatorMap.containsKey(ApplicationConstants.FIRSTRESULT) && logicalOperatorMap.containsKey(ApplicationConstants.MAXRESULT)))
				stringBuilder.append(" WHERE ");
			
				Set mapSet = logicalOperatorMap.entrySet();
				Iterator mapIterator = mapSet.iterator();
				while (mapIterator.hasNext())
				{
					
						
					Map.Entry mapEntry = (Map.Entry) mapIterator.next();
					String keyValue = (String) mapEntry.getKey();
					
					if(!containsKeyValue(keyValue) )
					getVal = ReflectionUtil.getValue(objectDO, keyValue);
			
					String value = (String) mapEntry.getValue();
					
					if(keyValue.equalsIgnoreCase(ApplicationConstants.FIRSTRESULT))
					{
						firstResult = value;
						
					}
					
					if(keyValue.equalsIgnoreCase(ApplicationConstants.MAXRESULT))
					{
						maxResult = value;
						
					}
					
					if(isContinue && !containsKeyValue(keyValue))
						stringBuilder.append(" AND ");
					
					switch(value)
					{
					case ApplicationConstants.EQUAL:
						stringBuilder.append(keyValue.toUpperCase()+" = "+"'"+getVal+"'");
						break;
					case ApplicationConstants.SLIKE:
						stringBuilder.append(keyValue.toUpperCase()+" LIKE "+"'"+getVal+"%"+"'");
						break;	
					case ApplicationConstants.ELIKE:
						stringBuilder.append(keyValue.toUpperCase()+" LIKE "+"'"+ "%"+getVal+"'");
						break;	
					case ApplicationConstants.CLIKE:
						stringBuilder.append(keyValue.toUpperCase()+" LIKE "+"'" +"%"+getVal+"%"+"'");
						break;	
						
					}
					if(containsKeyValue(keyValue))
					isContinue = false;
					else
						isContinue = true;

					
					
				}
			
			}
			
			if(CheckConditionUtil.checkNotNull(firstResult)&& CheckConditionUtil.checkNotNull(maxResult) )
			{
				StringBuilder stringBuilder1 = new StringBuilder("SELECT * FROM ("+stringBuilder+") tbl WHERE MyRowNumber BETWEEN "+firstResult+" AND "+maxResult+";" );
				stringBuilder = stringBuilder1;
			}
			return stringBuilder;
			
		 }
		
		public StringBuilder getSelectQueryForReport(Object objectDO,Map<String, String> logicalOperatorMap) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException, SQLException
		 {
			
			StringBuilder stringBuilder = new StringBuilder();
			Object getVal = null;
	
			
			if (logicalOperatorMap != null )
			{
			boolean isContinue = false;
				if(!logicalOperatorMap.isEmpty())
				stringBuilder.append(" WHERE ");
			
				Set mapSet = logicalOperatorMap.entrySet();
				Iterator mapIterator = mapSet.iterator();
				while (mapIterator.hasNext())
				{
					
						
					Map.Entry mapEntry = (Map.Entry) mapIterator.next();
					// property name
					String keyValue = (String) mapEntry.getKey();
					
					if(!containsKeyValue(keyValue) )
					getVal = ReflectionUtil.getValue(objectDO, keyValue);
			
					String value = (String) mapEntry.getValue();
					
				
					
					if(isContinue && !containsKeyValue(keyValue))
						stringBuilder.append(" AND ");
					
					switch(value)
					{
					case ApplicationConstants.EQUAL:
						stringBuilder.append(keyValue.toUpperCase()+" = "+"'"+getVal+"'");
						break;
					case ApplicationConstants.SLIKE:
						stringBuilder.append(keyValue.toUpperCase()+" LIKE "+"'"+getVal+"%"+"'");
						break;	
					case ApplicationConstants.ELIKE:
						stringBuilder.append(keyValue.toUpperCase()+" LIKE "+"'"+ "%"+getVal+"'");
						break;	
					case ApplicationConstants.CLIKE:
						stringBuilder.append(keyValue.toUpperCase()+" LIKE "+"'" +"%"+getVal+"%"+"'");
						break;	
						
					}
					if(containsKeyValue(keyValue))
					isContinue = false;
					else
						isContinue = true;

					
					
					
				}
			
			

			
		 }
			return stringBuilder;
		

		
	}

	}

