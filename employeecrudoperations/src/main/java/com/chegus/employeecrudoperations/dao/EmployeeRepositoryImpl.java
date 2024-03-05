package com.chegus.employeecrudoperations.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.chegus.employeecrudoperations.dto.Employee;

@Repository
public class EmployeeRepositoryImpl implements EmployeRepository
{
	private static SessionFactory factory;
	static
	{
		Configuration config = new Configuration();
		config.configure();
		
		factory = config.buildSessionFactory();
	}

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
			b = false;
		}
		session.close();
		return b;
	}

	@Override
	public List<Employee> getAllEmployees() 
	{
		Session session = factory.openSession();
		Query query = session.createQuery("FROM Employee");
		List<Employee> allEmps = query.getResultList();
		session.close();
		return allEmps;
	}

	@Override
	public Employee searchEmployee(int id)
	{
		Session session = factory.openSession();
		Employee e = session.get(Employee.class, id);
		session.close();
		return e;
	}
	
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
			b=false;
		}
		session.close();
		return b;
		
	}
	 @Override
	public boolean updateEmployee(Employee emp) {
		
		 boolean b = false;
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(emp);
		try
		{
			tx.commit();
			b = true;
		}
		catch (Exception e)
		{
			tx.rollback();
			b = false;
		}
		session.close();
		return b;
	}
}
