package com.chegus.geni.dao;

import com.chegus.geni.common.CommonDAO;
import com.chegus.geni.domain.BaseDO;
import com.chegus.geni.domain.CustomerDO;
import com.chegus.geni.domain.MaxIdDO;

public interface CustomerDAO<E,ID> extends CommonDAO<BaseDO,Integer>  {

	MaxIdDO getCustomerMaxIntId(String customerType);
	
	Integer getBranchIdByName(String branchName);
	


}
