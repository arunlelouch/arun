package com.chegus.geni.common;

import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;

import org.hibernate.HibernateException;
import org.hibernate.property.access.internal.PropertyAccessStrategyBasicImpl;
import org.hibernate.property.access.internal.PropertyAccessStrategyChainedImpl;
import org.hibernate.property.access.internal.PropertyAccessStrategyFieldImpl;
import org.hibernate.property.access.internal.PropertyAccessStrategyMapImpl;
import org.hibernate.property.access.spi.Setter;
import org.hibernate.transform.AliasedTupleSubsetResultTransformer;

import com.chegus.geni.util.ReflectionUtil;

/**
 * @author Mohammed Asif
 * @author Venkatesh Nettam
 *
 */

@SuppressWarnings("rawtypes") 
public class CustomAliasToBeanTransformer  extends AliasedTupleSubsetResultTransformer 
{
	private static final long serialVersionUID = -794343944094004857L;
	private static final String SEPARATOR = ".";
	private final Class resultClass;
	private boolean isInitialized;
	private String[] aliases;
	private Setter[] setters;

	public CustomAliasToBeanTransformer(Class resultClass)
	{
		if (resultClass == null) {
			throw new IllegalArgumentException("resultClass cannot be null");
		}
		this.isInitialized = false;
		this.resultClass = resultClass;
	}

	public boolean isTransformedValueATupleElement(String[] aliases, int tupleLength) {
		return false;
	}

	public Object transformTuple(Object[] tuple, String[] aliases) 
	{
		Object result;
		try
		{
			if (!(this.isInitialized))
			{
				initialize(aliases);
			} 
			else
			{
				check(aliases);
			}

			result = this.resultClass.newInstance();

			for (int i = 0; i < aliases.length; ++i) 
			{
				if(this.aliases[i].contains(SEPARATOR))
				{
					Object obj = ReflectionUtil.getValue(result, this.aliases[i].substring(0, this.aliases[i].lastIndexOf(SEPARATOR)));
					this.setters[i].set(obj, tuple[i], null);
				}
				else
				{
					this.setters[i].set(result, tuple[i], null);
				}
			}
		} 
		catch (InstantiationException e)
		{
			throw new HibernateException("Could not instantiate resultclass: " + this.resultClass.getName());
		} 
		catch (IllegalAccessException e) 
		{
			throw new HibernateException("Could not instantiate resultclass: " + this.resultClass.getName());
		}
		catch (NoSuchMethodException | SecurityException | IllegalArgumentException | InvocationTargetException e) 
		{
			throw new HibernateException("Could not instantiate resultclass: " + this.resultClass.getName());
		}

		return result;
	}

	private void initialize(String[] aliases)
	{
		PropertyAccessStrategyChainedImpl propertyAccessStrategy = new PropertyAccessStrategyChainedImpl(
																		PropertyAccessStrategyBasicImpl.INSTANCE,
																		PropertyAccessStrategyFieldImpl.INSTANCE,
																		PropertyAccessStrategyMapImpl.INSTANCE );
		
		this.setters = new Setter[aliases.length];
		this.aliases = new String[aliases.length];
		Object mainObject = null;
		for (int i = 0; i < aliases.length; ++i) 
		{
			String alias = aliases[i];
			if (alias != null)
			{
				this.aliases[i] = alias;
				if(alias.contains(SEPARATOR))
				{
					this.setters[i] =  null;
					try
					{
						if(mainObject == null)
						{
							mainObject = this.resultClass.newInstance();
						}
						
						Class classInfo = ReflectionUtil.getValue(mainObject, alias.substring(0, alias.lastIndexOf(SEPARATOR))).getClass();
						
						PropertyAccessStrategyChainedImpl tempAccessStrategy = new PropertyAccessStrategyChainedImpl(
								PropertyAccessStrategyBasicImpl.INSTANCE,
								PropertyAccessStrategyFieldImpl.INSTANCE,
								PropertyAccessStrategyMapImpl.INSTANCE );
						this.setters[i] = tempAccessStrategy.buildPropertyAccess( classInfo, alias.substring(alias.lastIndexOf(SEPARATOR)+1) ).getSetter();
					} 
					catch (Exception e)
					{
						throw new HibernateException("Error occured while generating setter of the class : " + this.resultClass.getName()+":"+e);
					}
				}
				else
				{
					this.setters[i] = propertyAccessStrategy.buildPropertyAccess(resultClass, alias).getSetter();
				}				
			}
		}
		this.isInitialized = true;
	}

	private void check(String[] aliases) {
		if (!(Arrays.equals(aliases, this.aliases)))
			throw new IllegalStateException("aliases are different from what is cached; aliases="
					+ Arrays.asList(aliases) + " cached=" + Arrays.asList(this.aliases));
	}

	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if ((o == null) || (super.getClass() != o.getClass())) {
			return false;
		}

		CustomAliasToBeanTransformer that = (CustomAliasToBeanTransformer) o;

		if (!(this.resultClass.equals(that.resultClass))) {
			return false;
		}

		return (Arrays.equals(this.aliases, that.aliases));
	}

	public int hashCode() {
		int result = this.resultClass.hashCode();
		result = 31 * result + ((this.aliases != null) ? Arrays.hashCode(this.aliases) : 0);
		return result;
	}

}
