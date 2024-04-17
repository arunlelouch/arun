package com.chegus.geni.controller;

import java.io.IOException;
import java.util.HashMap;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chegus.geni.common.CommonMessageSource;
import com.chegus.geni.common.CommonService;
import com.chegus.geni.controllerUtil.CustomerControllerUtil;
import com.chegus.geni.domain.AddressDO;
import com.chegus.geni.domain.BaseDO;
import com.chegus.geni.domain.BranchDO;
import com.chegus.geni.domain.CustomerDO;
import com.chegus.geni.domain.MaxIdDO;
import com.chegus.geni.domain.StockLoadingDO;
import com.chegus.geni.domain.UserDO;
import com.chegus.geni.service.CustomerService;
import com.chegus.geni.util.ApplicationConstants;
import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings({"unused","rawtypes","unchecked"})
@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;

	@Autowired
	CommonService commonService;
	
	@Autowired
	CustomerControllerUtil controllerUtil;

	private Map<String,Object> map = new HashMap<>();
	private Set<String> selectCol = new HashSet<String>();
	
	private static final String CUSTOMERSEARCH = "customersearch";
	private static final String CUSTOMERDETAILS = "customerdetails";
	
	@RequestMapping(value = "CustomerSearch")
	public ModelAndView search(HttpServletRequest request) throws Exception
	{
		ModelAndView modelAndView = new ModelAndView(CUSTOMERSEARCH);
		modelAndView.addObject(ApplicationConstants.ERRORMESSAGES,request.getParameter(ApplicationConstants.ERRORMESSAGES));
		modelAndView.addObject(ApplicationConstants.SUCCESSMESSAGES, request.getParameter(ApplicationConstants.SUCCESSMESSAGES));
		return modelAndView;
	}
	
	@RequestMapping(value = "CustomerCreate")
	public ModelAndView create(@ModelAttribute("customerDO") CustomerDO customerDO,  HttpServletRequest request,HttpServletResponse resp) throws Exception
	{		
		ModelAndView modelAndView =new ModelAndView(CUSTOMERDETAILS);
		modelAndView.addObject("customerDO", customerDO);
		List<BranchDO> branchDOs = customerService.getbranch();
		modelAndView.addObject("branchDO", branchDOs);		
        modelAndView.addObject(ApplicationConstants.URL,"CustomerSave.html?action=create");
        modelAndView.addObject(ApplicationConstants.SUCCESSMESSAGES, request.getParameter(ApplicationConstants.SUCCESSMESSAGES));
        modelAndView.addObject(ApplicationConstants.ERRORMESSAGES, request.getParameter(ApplicationConstants.ERRORMESSAGES));
        return modelAndView;
	}

    @RequestMapping(value = "CustomerSave")
    public ModelAndView saveOrUpdate(@ModelAttribute("customerDO") CustomerDO customerDO, HttpServletRequest request, HttpSession session) 
    {
    	ModelAndView modelAndView = new ModelAndView();
        String action = request.getParameter("action");
        Object attribute = session.getAttribute("userId");
        
        if ("create".equals(action)) 
        {        
        	customerService.saveOrUpdateCustomer(customerDO, session);
        	Object[] obj = {"ContractId",customerDO.getIntId()};
			try { 
					modelAndView.addObject(ApplicationConstants.SUCCESSMESSAGES, CommonMessageSource.getMessage("info.UPDATESUCCESSMESSAGE", obj));
				}catch (Exception e) {
					e.printStackTrace();
				}
        } 
        else if ("edit".equals(action)) 
        {
        	customerService.saveOrUpdateCustomer(customerDO, session);
        	Object[] obj = {"ContractId",customerDO.getIntId()};
			try { 
					modelAndView.addObject(ApplicationConstants.SUCCESSMESSAGES, CommonMessageSource.getMessage("info.UPDATESUCCESSMESSAGE", obj));
				}catch (Exception e) {
					e.printStackTrace();
				}
        }
        modelAndView.setViewName("redirect:/CustomerSearch.html");
        return modelAndView; 
    }

    @RequestMapping(value = "/CustomerEdit")
    public ModelAndView edit(@ModelAttribute("customerDO") CustomerDO customerDO, HttpServletRequest request)
    {
        ModelAndView modelAndView = new ModelAndView(CUSTOMERDETAILS);
        CustomerDO existingCustomerDO = (CustomerDO) customerService.getCustomerById( customerDO.getId() ,CustomerDO.class);
        List<BranchDO> branchDOs = customerService.getbranch();
		modelAndView.addObject("branchDO", branchDOs);
        modelAndView.addObject("customerDO", existingCustomerDO);
        modelAndView.addObject(ApplicationConstants.URL, "CustomerSave.html?action=edit");
        return modelAndView;
    }

    @RequestMapping(value = "/CustomerDelete")
    public ModelAndView delete(@ModelAttribute("customerDO") CustomerDO customerDO,HttpServletRequest request)
    {
    	String id = request.getParameter("id");
        ModelAndView modelAndView = new ModelAndView("redirect:/CustomerSearch.html?action=delete");
        customerService.removeCustomer(CustomerDO.class, Integer.parseInt(id));
        Object[] obj = {"ContractId",customerDO.getIntId()};
		try { 
				modelAndView.addObject(ApplicationConstants.SUCCESSMESSAGES, CommonMessageSource.getMessage("info.DELETESUCCESSMESSAGE", obj));
			}catch (Exception e) {
				e.printStackTrace();
			}
        return modelAndView;
    }
	
    @RequestMapping(value="/branches")
    @ResponseBody
    public ResponseEntity<List<BranchDO>> getAllBranches() {
        map.clear();
        selectCol.clear();
        selectCol.add("Id");
        selectCol.add("branchName");
        map.put(ApplicationConstants.SELECT_COLUMNS, selectCol);
        List<BranchDO> branchDOs = (List<BranchDO>) commonService.commonSearch(new BranchDO(), map, null, null, null);

        // Return ResponseEntity with the branch data and HTTP status OK
        return new ResponseEntity<>(branchDOs, HttpStatus.OK);
    }

}
