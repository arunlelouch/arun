package edu.jspiders.cloningdemo.deepcopy;

public class Employee implements Cloneable
{
	int id;
	String name;
	double salary;
	Address address;
	
	public Employee(int id, String name, double salary, Address address) 
	{
		super();
		this.id = id;
		this.name = name;
		this.salary = salary;
		this.address = address;
	}
	
	@Override
	public String toString() 
	{
		return "Employee [id=" + id + ", name=" + name + ", salary=" + salary + ", address=" + address + "]";
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException
	{
		Employee e = (Employee) super.clone();
		e.address = (Address) this.address.clone();
		return e;
	}
	
}
