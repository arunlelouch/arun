package com.chegus.employeecrudoperations.dao;

import java.util.List;

import com.chegus.employeecrudoperations.dto.Employee;

public interface EmployeRepository
{
	boolean insertEmployee(Employee e);

	List<Employee> getAllEmployees();

	Employee searchEmployee(int id);
	
	boolean updateEmployee(Employee emp);
	
	boolean deleteEmployee(int id);
}
