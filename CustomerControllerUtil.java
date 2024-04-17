package com.chegus.geni.controllerUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.chegus.geni.domain.CustomerDO;
import com.chegus.geni.domain.MaxIdDO;
import com.chegus.geni.service.CustomerService;

@Component
public class CustomerControllerUtil {

	@Autowired
	CustomerService customerService;
	
	@Transactional
	public CustomerDO getCustomerMaxIntId(String customerType, CustomerDO customerDO) {
		
		MaxIdDO maxIdDO = customerService.getCustomerMaxIntId(customerType);
		
		if(null!=maxIdDO)
		{
			Integer maxNo = maxIdDO.getMaxId();
			customerDO.setIntId( customerType+"-"+String.format("%04d",(maxNo))  );
		}
		
		return customerDO;
	}
}
