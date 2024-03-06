package edu.jspiders.cloningdemo.shallowcopy;

public class MainAppOfShallowCopy 
{
	public static void main(String[] args) throws CloneNotSupportedException
	{
		Address a = new Address(101, "xyz", 563021);
		Employee e = new Employee(10, "Ramu", 3.6, a);
		
		System.out.println("Original object "+e);
		
		Employee copye = (Employee) e.clone();
		System.out.println("Copy object "+copye);
		
		copye.address.houseNumber = 201;
		
		System.out.println("After change");
		
		System.out.println("Original object "+e);
		System.out.println("Copy object "+copye);
		
	}
}
