package com.chegus.geni.common;

import java.util.List;

import com.chegus.geni.domain.AccessListDO;
import com.chegus.geni.domain.ComboTableDO;
import com.chegus.geni.domain.CurrencyDO;
import com.chegus.geni.domain.ModuleDO;

public interface CommonCacheService 
{
	public List<ComboTableDO> get(String comboId);
	public void resetAllComboEntries();
	public void resetComboId(String comboId);
	public List<ComboTableDO> update(String comboId);
	
	public List<AccessListDO> getAccessList(String accessId);
	public List<AccessListDO> updateAccessList(String accessId);
	
	public List<ModuleDO> getModuleList(String moduleId);
	public List<ModuleDO> updateModuleList(String moduleId);
	public List<CurrencyDO> getCurrencyList(String string);
	public List<CurrencyDO> updateCurrencyList(String string);
	
}
