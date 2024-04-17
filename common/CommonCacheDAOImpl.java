package com.chegus.geni.common;

import java.util.Comparator;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.chegus.geni.domain.AccessListDO;
import com.chegus.geni.domain.ComboTableDO;
import com.chegus.geni.domain.CurrencyDO;
import com.chegus.geni.domain.ModuleDO;
import com.chegus.geni.util.LoggerUtil;
import com.chegus.geni.util.SortComboTable;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Repository
public class CommonCacheDAOImpl implements CommonCacheDAO
{	
	@Autowired
	private SessionFactory sessionFactory;
	
	protected Session currentSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	@Cacheable(value="commonComboCache",key="#comboId")
	public List<ComboTableDO> get(String comboId) 
	{
		return getComboList(comboId); 
	}

	@Override
	@CachePut(value="commonComboCache",key="#comboId")
	public List<ComboTableDO> update(String comboId) 
	{
		return getComboList(comboId); 
	}

	private List<ComboTableDO> getComboList(String tableField) 
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(ComboTableDO.class);
		criteria.add(Restrictions.eq("tableField", tableField));
		criteria.add(Restrictions.eq("active", "Y").ignoreCase());		
		List list = criteria.list();
		SortComboTable.sort(list); 
		return list; 
	}

	@Override
	@CacheEvict(value = "commonComboCache", allEntries = true, beforeInvocation=true)
	public void resetAllComboEntries() 
	{
		LoggerUtil.getLogger().info(" All Combo Entries have been successfully cleared ");
	}

	@Override
	@CacheEvict(value="commonComboCache",key="#comboId", beforeInvocation=true)
	public void resetComboId(String comboId) 
	{
		LoggerUtil.getLogger().info(" Combo ID \""+comboId+"\" is been successfully cleared ");
	}


	@Override
	@Cacheable(value="commonAccessListLoginCache",key="#accessId")
	public List<AccessListDO> getAccessList(String accessId) 
	{
		return getAccessListData();
	}
	
	private List<AccessListDO> getAccessListData() 
	{
		CriteriaQuery query = currentSession().getCriteriaBuilder().createQuery(AccessListDO.class);
		Root<Object> root = query.from(AccessListDO.class);
		query.select(root);
		return currentSession().createQuery(query).getResultList();
	}
	@Override
	@CachePut(value="commonAccessListLoginCache",key="#accessId")
	public List<AccessListDO> updateAccessList(String accessId) 
	{
		return getAccessListData();
	}

	@Override
	@Cacheable(value="commonModuleListLoginCache",key="#moduleId")
	public List<ModuleDO> getModuleList(String moduleId)
	{
		return getModuleListData(); 
	}
	private List<ModuleDO> getModuleListData() 
	{
		CriteriaBuilder builder = currentSession().getCriteriaBuilder();
		CriteriaQuery query = builder.createQuery(ModuleDO.class);
		Root<Object> root = query.from(ModuleDO.class);
		query.select( root ).where(builder.equal(root.get("active"), "Y"));
		List<ModuleDO> moduleDOs = currentSession().createQuery(query).getResultList();
		for (ModuleDO moduleDO : moduleDOs) 
		{
			Hibernate.initialize(((ModuleDO)moduleDO).getModuleFtrDOList());
		}
		
		moduleDOs.sort(new Comparator<ModuleDO>() {
			@Override
			public int compare(ModuleDO o1, ModuleDO o2) {
					return o1.getOrder().compareTo(o2.getOrder());
			}
		});
		return moduleDOs;
	}
	@Override
	@CachePut(value="commonModuleListLoginCache",key="#moduleId")
	public List<ModuleDO> updateModuleList(String moduleId)
	{
		return getModuleListData(); 
	}

	@Override
	@Cacheable(value="commonCurrencyListCache",key="#currencyId")
	public List<CurrencyDO> getCurrencyList(String currencyId) 
	{
		return getCurrencyListData();
	}
	private List<CurrencyDO> getCurrencyListData() 
	{
		return sessionFactory.getCurrentSession().createCriteria(CurrencyDO.class).list();
	}
	@Override
	@CachePut(value="commonCurrencyListCache",key="#currencyId")
	public List<CurrencyDO> updateCurrencyList(String currencyId) 
	{
		return getCurrencyListData();
	}


}
