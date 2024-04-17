package com.chegus.geni.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.chegus.geni.common.CommonService;
import com.chegus.geni.controllerUtil.CustomerControllerUtil;
import com.chegus.geni.dao.CustomerDAO;
import com.chegus.geni.domain.AddressDO;
import com.chegus.geni.domain.BaseDO;
import com.chegus.geni.domain.BranchDO;
import com.chegus.geni.domain.CustomerDO;
import com.chegus.geni.domain.MaxIdDO;
import com.chegus.geni.domain.UserDO;
import com.chegus.geni.service.CustomerService;
import com.chegus.geni.util.AdditionalFieldSetUtil;
import com.chegus.geni.util.ApplicationConstants;

@SuppressWarnings({"rawtypes","unchecked"})
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO customerDAO;

	@Autowired
	CustomerControllerUtil controllerUtil;

	@Autowired
	CommonService commonService;
	
	private Map<String,Object> map = new HashMap<>();
	private Set<String> selectCol = new HashSet<String>();
	
	@Transactional
	@Override
	public void saveOrUpdate(BaseDO baseDO) throws Exception {
		try{
			if(null == baseDO.getId())
				baseDO.setAuditAction("I");
			else
				baseDO.setAuditAction("U");
			
			AdditionalFieldSetUtil.setAdditionalFields(baseDO);
			customerDAO.saveOrUpdate(baseDO);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	/* 
	@Override
	@Transactional
	public void updateAddress(BaseDO AddressDO) throws Exception {
		AddressDO.setAuditAction("U");
		AdditionalFieldSetUtil.setAdditionalFields(AddressDO);
		customerDAO.saveOrUpdate(AddressDO);
	}
		*/
	
	@Transactional
	@Override
	public Object getCustomerById(Integer id, Class<? extends BaseDO> entityClass) {
		
		return customerDAO.getById(id, entityClass);
	}

	@Override
	@Transactional
	public void removeCustomer(Class<? extends BaseDO> entityClass, Integer id) {

		customerDAO.deleteById(id, entityClass);
	}

	@Override
	@Transactional
	public void removeAddress(AddressDO addressDO) {
		customerDAO.delete(addressDO);
	}
		
	@Override
	@Transactional
	public void save(UserDO userDO) {
		customerDAO.save(userDO);
		
	}

	@Override
	@Transactional
	public MaxIdDO getCustomerMaxIntId(String customerType) {
		
		return customerDAO.getCustomerMaxIntId(customerType);
	}
	
	@Override
	@Transactional
	public void saveOrUpdateCustomer(CustomerDO customerDO, HttpSession session) 
	{
	    try {
	        if (customerDO.getId() == null) 
	        {	            
	            customerDO = controllerUtil.getCustomerMaxIntId("CUSTMR", customerDO);
	            UserDO userDO = new UserDO();
	            userDO.setId(Integer.parseInt(session.getAttribute("userId1").toString()));
	            customerDO.setUserid(userDO);

	            saveOrUpdate(customerDO);

	            // Save addresses
	            for (AddressDO addressDO : customerDO.getAddressDOs())
	            {
	                if (addressDO.getAddressOne() != null)
	                {
	                    addressDO.setCustomerDO(customerDO);
	                    saveOrUpdate(addressDO);
	                }
	            }
	        }
	        else 
	        {
	        	CustomerDO existingCustomerDO = (CustomerDO) getCustomerById(customerDO.getId(), CustomerDO.class);

//	            if (existingCustomerDO != null)
//	            {
//	                existingCustomerDO.setName(customerDO.getName());
//	                existingCustomerDO.setGender(customerDO.getGender());
//	                existingCustomerDO.setPhone(customerDO.getPhone());
//	                existingCustomerDO.setEmail(customerDO.getEmail());

	                saveOrUpdate(existingCustomerDO);

	                List<AddressDO> existingAddresses = existingCustomerDO.getAddressDOs();
	                List<AddressDO> newAddresses = customerDO.getAddressDOs();

	                for (AddressDO existingAddress : existingAddresses) {
	                    if (!newAddresses.contains(existingAddress)) {
	                    	removeAddress(existingAddress);
	                    }
	                }

	                for (AddressDO updatedAddress : newAddresses) {
	                    if (updatedAddress.getId() != null)
	                    {
	                        boolean addressFound = false;
	                        for (AddressDO existingAddress : existingAddresses)
	                        {
	                            if (existingAddress.getId().equals(updatedAddress.getId())) 
	                            {	                      
	                                existingAddress.setAddressOne(updatedAddress.getAddressOne());
	                                existingAddress.setAddressTwo(updatedAddress.getAddressTwo());
//	                                if (updatedAddress.getBranchDO() != null && updatedAddress.getBranchDO().getBranchName() != null) 
//	                                {                           
//	                                    String branchName = updatedAddress.getBranchDO().getBranchName();
//	                                    Integer Id = customerDAO.getBranchIdByName(branchName);                                     
//	                                    if (Id != null) {
//	                                        updatedAddress.getBranchDO().setId(Id);
//	                                    }
//	                                    else 
//	                                    {
//	                                        System.out.println("Entered branchNames, Id is null");
//	                                    }
//	                                }
	                                BranchDO branchDO = new BranchDO();
	                                branchDO.setId(updatedAddress.getBranchDO().getId());
	                                existingAddress.setBranchDO(branchDO);
	                                existingAddress.setCity(updatedAddress.getCity());
	                                existingAddress.setState(updatedAddress.getState());
	                                addressFound = true;
	                                break;
	                            }
	                        }
	                        if (!addressFound)
	                        {
	                            updatedAddress.setCustomerDO(existingCustomerDO);
	                            saveOrUpdate(updatedAddress);
	                        }
	                    }
	                    else {
	                        updatedAddress.setCustomerDO(existingCustomerDO);
	                        saveOrUpdate(updatedAddress);
	                    }
	                }
	                existingCustomerDO.setAddressDOs(existingAddresses);

	                saveOrUpdate(existingCustomerDO);	                
	            }
//	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	} 
	
	
	@Override
	public List<BranchDO> getbranch()
	{
//		BranchDO branchDO = new BranchDO();
		map.clear();
		selectCol.clear();
		selectCol.add("Id");
		selectCol.add("branchName");
		map.put(ApplicationConstants.SELECT_COLUMNS, selectCol);
		List<BranchDO> branchDOs =(List<BranchDO>) commonService.commonSearch(new BranchDO(), map, null, null, null);
		return branchDOs;
	}

}
