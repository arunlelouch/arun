package com.chegus.geni.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.chegus.geni.domain.AccessListDO;
import com.chegus.geni.domain.ComboTableDO;
import com.chegus.geni.domain.CurrencyDO;
import com.chegus.geni.domain.ModuleDO;
import com.chegus.geni.util.LoggerUtil;

import net.sf.ehcache.CacheManager;

@SuppressWarnings({ "unchecked" })
@Component
public class CommonCacheManager 
{
	private static CacheManager cacheManager;
	private static CommonCacheService commonCacheService;

	@Autowired
	public void setCacheManager(CacheManager cacheManager) 
	{
		CommonCacheManager.cacheManager = cacheManager;
	}

	@Autowired
	public void setCommonCacheService(CommonCacheService commonCacheService) 
	{
		CommonCacheManager.commonCacheService = commonCacheService;
	}

	public static Object getComboCache(String comboId)
	{
		if(null == cacheManager.getCache("commonComboCache").get(comboId))
		{ 
			return commonCacheService.get(comboId); 
		}
		return cacheManager.getCache("commonComboCache").get(comboId).getObjectValue();
	}

	public static void updateComboCache(String comboId)
	{
		if(null != cacheManager.getCache("commonComboCache").get(comboId))
		{ 
			commonCacheService.update(comboId);
			LoggerUtil.getLogger().info(" Combo ID \""+comboId+"\" is been successfully updated ");
		}
	}

	public static void resetAllComboEntries()
	{
		commonCacheService.resetAllComboEntries();
	}

	public static void resetComboId(String comboId)
	{
		commonCacheService.resetComboId(comboId);
	}

	public static String getComboText(String comboId,String comboField)
	{
		List<ComboTableDO> comboList = (List<ComboTableDO>)getComboCache(comboId);
		ComboTableDO comboDO = new ComboTableDO();
		comboDO.setTableField(comboId);
		comboDO.setComboField(comboField);
		int index = comboList.indexOf(comboDO);
		comboDO = null;
		return comboList.get(index).getText();
	}
	/*public static List<StatusDO> getStatusCache_BY_STSTYPE(String stsType)
	{
		if(null == cacheManager.getCache("commonStatusCache").get(stsType))
		{ 
			return commonCacheService.getStatusCache(stsType); 
		}
		return (List<StatusDO>) cacheManager.getCache("commonStatusCache").get(stsType).getObjectValue();
	}

	public static StatusDO getStatusCache_BY_STSID(String stsType, String stsId)
	{
		for(StatusDO statusDO : getStatusCache_BY_STSTYPE(stsType))
		{
			if(stsId.equals(statusDO.getStsId()))
			{
				return statusDO;
			}
		}
		return null;
	}

	public static void updateStatusCache(String stsType)
	{
		if(null != cacheManager.getCache("commonStatusCache").get(stsType))
		{ 
			commonCacheService.updateStatusCache(stsType);
			LoggerUtil.getLogger().info(" Status Type \""+stsType+"\" is been successfully updated ");
		}
	}*/
	
	public static List<AccessListDO> get_Login_AccessListCache()
	{
		if(null == cacheManager.getCache("commonAccessListLoginCache").get("allAccessListKey"))
		{ 
			return commonCacheService.getAccessList("allAccessListKey"); 
		}
		return (List<AccessListDO>)cacheManager.getCache("commonAccessListLoginCache").get("allAccessListKey").getObjectValue();
	}
	
	public static void update_Login_AccessListCache()
	{
		if(null != cacheManager.getCache("commonAccessListLoginCache").get("allAccessListKey"))
		{ 
			commonCacheService.updateAccessList("allAccessListKey");
			LoggerUtil.getLogger().info(" Access List is been successfully refreshed ");
		}
	}
	
	public static List<ModuleDO> get_Login_ModuleListCache()
	{
		if(null == cacheManager.getCache("commonModuleListLoginCache").get("allModuleListKey"))
		{ 
			return commonCacheService.getModuleList("allModuleListKey"); 
		}
		return (List<ModuleDO>)cacheManager.getCache("commonModuleListLoginCache").get("allModuleListKey").getObjectValue();
	}
	
	public static void update_Login_ModuleListCache()
	{
		if(null != cacheManager.getCache("commonModuleListLoginCache").get("allModuleListKey"))
		{ 
			try
			{
			  commonCacheService.updateModuleList("allModuleListKey");
			}
			catch(Exception e) {
				e.printStackTrace();
				};
			LoggerUtil.getLogger().info(" Module List is been successfully refreshed ");
		}
	}
	
	public static List<CurrencyDO> getCurrencyListCache()
	{
		if(null == cacheManager.getCache("commonCurrencyListCache").get("currencyKey"))
		{ 
			return commonCacheService.getCurrencyList("currencyKey"); 
		}
		return (List<CurrencyDO>)cacheManager.getCache("commonCurrencyListCache").get("currencyKey").getObjectValue();
	}
	
	public static void updateCurrencyListCache()
	{
		if(null != cacheManager.getCache("commonCurrencyListCache").get("currencyKey"))
		{ 
			commonCacheService.updateCurrencyList("currencyKey");
			LoggerUtil.getLogger().info(" Currency List is been successfully refreshed ");
		}
	}
}