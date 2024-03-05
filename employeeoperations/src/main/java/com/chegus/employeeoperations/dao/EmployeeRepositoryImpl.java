package com.chegus.employeeoperations.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.chegus.employeeoperations.dto.Department;
import com.chegus.employeeoperations.dto.Employee;

@Repository
public class EmployeeRepositoryImpl implements EmployeRepository
{
	private static SessionFactory factory;
	static {
		    try {
		        Configuration config = new Configuration();
		        config.configure();
		        factory = config.buildSessionFactory();
		    }
		    catch (Exception e) {
		        e.printStackTrace();
		        throw new ExceptionInInitializerError(e);
		    }
	}

	@Transactional
	@Override
	public boolean insertEmployee(Employee emp)
	{
		boolean b = false;
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(emp);
		
		try
		{
			tx.commit();
			b = true;
		}
		catch (Exception e)
		{
			tx.rollback();
			e.printStackTrace();
			b = false;
		}
		session.close();
		return b;
	}

	@Transactional
	@Override
	public List<Employee> getAllEmployees() 
	{
		Session session = factory.openSession();
		Query query = session.createQuery("FROM Employee");
		List<Employee> allEmps = query.getResultList();
		session.close();
		return allEmps;
	}

	@Transactional
	@Override
	public Employee getEmployeeById(int id)
	{
		Session session = factory.openSession();
		Employee e = session.get(Employee.class, id);
		session.close();
		return e;
	}
	
	@Transactional
	public boolean deleteEmployee(int id)
	{
		boolean b = false;
		Session session= factory.openSession();
		Employee e=session.get(Employee.class, id);
		Transaction tx = session.beginTransaction();
		session.delete(e);
		try
		{
			tx.commit();
			b= true;
		}
		catch (Exception ex)
		{
			tx.rollback();
			ex.printStackTrace();
			b=false;
		}
		session.close();
		return b;
		
	}
	
	@Transactional
	@Override
	public boolean updateEmployee(Employee updatedEmployee) {
	    Session session = factory.openSession();
	    Transaction tx = session.beginTransaction();
	    boolean b;

	    try {
	        Employee existingEmployee = getEmployeeById(updatedEmployee.getId());

	        existingEmployee.setName(updatedEmployee.getName());
	        existingEmployee.setEmail(updatedEmployee.getEmail());
	        existingEmployee.setDob(updatedEmployee.getDob());
	        existingEmployee.setSalary(updatedEmployee.getSalary());
	        existingEmployee.setStatus(updatedEmployee.isStatus());
	        
	        int yob = Integer.parseInt(updatedEmployee.getDob().substring(0, 4));
			int curYear = LocalDate.now().getYear();
			int age = curYear - yob;
			existingEmployee.setAge(age);

	        List<Department> existingDepts = existingEmployee.getDept();
	        List<Department> newDepts = updatedEmployee.getDept();
	        List<Department> deptToRemove = new ArrayList<>();

	        // Update or add new departments
	        for (Department updatedDept : newDepts) {
	            if (updatedDept.getDeptId() != null) {
	                boolean deptfound = false;
	                for (int i = 0; i < existingDepts.size(); i++) {
	                    Department existingDept = existingDepts.get(i);
	                    if (updatedDept.getDeptId().equals(existingDept.getDeptId())) {
	                        
	                        existingDept.setDeptName(updatedDept.getDeptName());
	                        existingDept.setDeptType(updatedDept.getDeptType());
	                        existingDept.setDeptLoc(updatedDept.getDeptLoc());
	                        existingDept.setDeptManager(updatedDept.getDeptManager());
	                        deptfound = true;
	                        break;
	                    }
	                }

	                if (!deptfound) {
	                    
	                    updatedDept.setEmployee(existingEmployee);
	                    existingDepts.add(updatedDept);
	                }
	            } else {
	                
	                updatedDept.setEmployee(existingEmployee);
	                existingDepts.add(updatedDept);
	            }
	        }

	        
	       // deptToRemove.addAll(existingDepts);
	        deptToRemove.removeAll(newDepts);
	        //existingDepts.removeAll(deptToRemove);

	        existingEmployee.setDept(existingDepts);

	        session.update(existingEmployee);
	        tx.commit();
	        b = true;
	    } catch (Exception e) {
	        tx.rollback();
	        e.printStackTrace();
	        b = false;
	    } finally {
	        session.close();
	    }

	    return b;
	}

	 
	@Transactional
	 @Override
	public boolean insertDepartment(Department dept) {
		 boolean b = false;
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(dept);
		try
		{
			tx.commit();
			b = true;
		}
			catch (Exception e)
		{
			tx.rollback();
			e.printStackTrace();
				b = false;
		}
		session.close();
		return b;
	}
	
	@Transactional
	 @Override
	public List<Department> getAllDepartments() {
		Session session =factory.openSession();
		Query query = session.createQuery("FROM Department");
		List<Department> departments = query.getResultList();
		session.close();
		return departments;
	}
	
	@Transactional
	 @Override
	 public List<String> getAllDepartmentNames() {
	     Session session = factory.openSession();
	     List<String> departmentNames = null;

	     try {
	         CriteriaBuilder builder = session.getCriteriaBuilder();
	         CriteriaQuery<String> query = builder.createQuery(String.class);
	         Root<Department> root = query.from(Department.class);

	         query.select(root.get("deptName")); 
	         departmentNames = session.createQuery(query).getResultList();
	     } finally {
	         session.close();
	     }

	     return departmentNames;
	 }
	 
	@Transactional
	 @Override
	public Department getDepartmentById(int id) {
		Session session = factory.openSession();
		Department dept = session.get(Department.class, id);
		session.close();
		return dept;
	}
	private void updateDepartments(Employee existingEmployee, List<Department> updatedDepartments) {
        // Clear existing departments and add updated departments
        existingEmployee.getDept().clear();
        existingEmployee.getDept().addAll(updatedDepartments);

        // Set the employee association for each department
        for (Department department : updatedDepartments) {
            department.setEmployee(existingEmployee);
        }
    }
}
