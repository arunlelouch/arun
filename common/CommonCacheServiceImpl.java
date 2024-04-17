package com.chegus.geni.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chegus.geni.domain.AccessListDO;
import com.chegus.geni.domain.ComboTableDO;
import com.chegus.geni.domain.CurrencyDO;
import com.chegus.geni.domain.ModuleDO;

@Service
public class CommonCacheServiceImpl implements CommonCacheService
{
	@Autowired
	private CommonCacheDAO commonCacheDAO;

	@Override
	@Transactional
	public List<ComboTableDO> get(String comboId) 
	{
		return commonCacheDAO.get(comboId);
	}

	@Override
	@Transactional
	public void resetAllComboEntries() 
	{		
		commonCacheDAO.resetAllComboEntries();
	}

	@Override
	@Transactional
	public void resetComboId(String comboId) {
		commonCacheDAO.resetComboId(comboId);
	}

	@Override
	@Transactional
	public List<ComboTableDO> update(String comboId) 
	{		
		return commonCacheDAO.update(comboId);
	}

	@Transactional
	@Override
	public List<AccessListDO> getAccessList(String accessId) 
	{
		return commonCacheDAO.getAccessList(accessId);
	}

	@Transactional
	@Override
	public List<AccessListDO> updateAccessList(String accessId) 
	{
		return commonCacheDAO.updateAccessList(accessId);
	}

	@Transactional
	@Override
	public List<ModuleDO> getModuleList(String moduleId) 
	{
		return commonCacheDAO.getModuleList(moduleId);
	}

	@Transactional
	@Override
	public List<ModuleDO> updateModuleList(String moduleId) 
	{
		return commonCacheDAO.updateModuleList(moduleId);
	}

	@Override
	@Transactional
	public List<CurrencyDO> getCurrencyList(String string) {
		return commonCacheDAO.getCurrencyList(string);
	}

	@Override
	@Transactional
	public List<CurrencyDO> updateCurrencyList(String string) {
		return commonCacheDAO.updateCurrencyList(string);
	}
	
}