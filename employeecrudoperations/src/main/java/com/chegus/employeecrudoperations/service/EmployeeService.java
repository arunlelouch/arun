package com.chegus.employeecrudoperations.service;

import java.util.List;

import com.chegus.employeecrudoperations.dto.Employee;

public interface EmployeeService
{
	boolean addEmployee(Employee e);

	List<Employee> displayAllEmps();

	Employee searchEmployee(int id);
	
	boolean deleteEmployee(int id);
	
	boolean updateEmployee(Employee emp);
}
