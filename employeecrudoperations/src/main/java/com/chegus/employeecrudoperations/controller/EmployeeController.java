package com.chegus.employeecrudoperations.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.chegus.employeecrudoperations.dto.Employee;
import com.chegus.employeecrudoperations.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController
{
	@Autowired
	private EmployeeService service;
	
	@RequestMapping("/index")
	public String getIndexPage()
	{
		return "index";
	}
	
	@RequestMapping(path="/addEmpForm",method=RequestMethod.GET)
	public String getAddFormPage()
	{
		return "addEmployeeForm";
	}
	
	@RequestMapping(path="/addemp",method=RequestMethod.POST)
	public RedirectView addEmployee(Employee e,HttpServletRequest request)
	{
		RedirectView redirectView =new RedirectView();
		boolean isInserted = service.addEmployee(e);
		String msg = "";
		if(isInserted)
			msg = "Inserted";
		else
			msg = "NOT Inserted";
		redirectView.setUrl(request.getContextPath()+"/employee/displayAll");
		System.out.println(msg);
	
		return redirectView;
	}
	
	@RequestMapping(path="/displayAll",method=RequestMethod.GET)
	public String displayAllEmployees(Model empModel)
	{
		List<Employee> allEmps = service.displayAllEmps();
		empModel.addAttribute("allEmployees", allEmps);
		return "displayAll";
	}
	
	@RequestMapping(path="/edit/{id}",method=RequestMethod.GET)
	public String getEditPage(@PathVariable("id") int id,Model empModel)
	{
		
		//System.out.println(id);
		Employee emp = service.searchEmployee(id);
		
		empModel.addAttribute("emp", emp);
		return "editPage";
	}
	
	@RequestMapping(path="/update", method=RequestMethod.POST)
	public RedirectView updateEmployee(@RequestParam("id") int id, Employee e, HttpServletRequest request) {
	    
	    Employee existingEmp = service.searchEmployee(id);

	    if (existingEmp != null) {
	        existingEmp.setName(e.getName());
	        existingEmp.setAge(e.getAge());
	        existingEmp.setDob(e.getDob());
	        existingEmp.setEmail(e.getEmail());
	        existingEmp.setSalary(e.getSalary());
	        existingEmp.setStatus(e.isStatus());

	        boolean isUpdated = service.updateEmployee(existingEmp);

	        if (isUpdated) {
	            System.out.println("Employee Updated: " + existingEmp);
	        } else {
	            System.out.println("Employee Not Updated");
	        }
	    } else {
	        System.out.println(id + " : Id not found");
	    }

	    RedirectView redirectView = new RedirectView();
	    redirectView.setUrl(request.getContextPath() + "/employee/displayAll");
	    return redirectView;
	}

	
	@RequestMapping(path="/delete/{id}", method= RequestMethod.GET)
	public RedirectView deleteEmployee(@PathVariable("id") int id,HttpServletRequest request) 
	{
		RedirectView redirectView =new RedirectView();
		boolean isInserted = service.deleteEmployee(id);
		String msg = "";
		if(isInserted)
			msg = "Deleted";
		else
			msg = "NOT Deleted";
		redirectView.setUrl(request.getContextPath()+"/employee/displayAll");
		System.out.println(msg);
		return redirectView;
	}
}
