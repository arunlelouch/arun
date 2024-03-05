package com.chegus.employeeoperations.dao;

import java.util.List;

import com.chegus.employeeoperations.dto.Department;
import com.chegus.employeeoperations.dto.Employee;

public interface EmployeRepository
{
	boolean insertEmployee(Employee e);

	List<Employee> getAllEmployees();

	Employee getEmployeeById(int id);
	
	boolean updateEmployee(Employee emp);
	
	boolean deleteEmployee(int id);
	
	boolean insertDepartment(Department dept);

	List<Department> getAllDepartments();
	
	List<String> getAllDepartmentNames();
	
	Department getDepartmentById(int id);
}
