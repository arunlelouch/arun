package com.chegus.employeecrudoperations.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chegus.employeecrudoperations.dao.EmployeRepository;
import com.chegus.employeecrudoperations.dto.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService
{

	@Autowired
	private EmployeRepository repository;
	
	@Override
	public boolean addEmployee(Employee e)
	{
		//calculate age
		int yob = Integer.parseInt(e.getDob().substring(0, 4));
		int curYear = LocalDate.now().getYear();
		int age = curYear - yob;
		e.setAge(age);
		
		return repository.insertEmployee(e);
		
	}

	@Override
	public List<Employee> displayAllEmps() 
	{
		return repository.getAllEmployees();
	}

	@Override
	public Employee searchEmployee(int id) {
		return repository.searchEmployee(id);
	}
	@Override
	public boolean deleteEmployee(int id) {
		
		return repository.deleteEmployee(id);
	}
	 
	@Override
	public boolean updateEmployee(Employee emp) {
		
		//calculate age
				int yob = Integer.parseInt(emp.getDob().substring(0, 4));
				int curYear = LocalDate.now().getYear();
				int age = curYear - yob;
				emp.setAge(age);
				
		return repository.updateEmployee(emp);
	}
}
