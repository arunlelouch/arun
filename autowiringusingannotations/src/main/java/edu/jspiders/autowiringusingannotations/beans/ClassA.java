package edu.jspiders.autowiringusingannotations.beans;

import org.springframework.beans.factory.annotation.Autowired;

public class ClassA 
{
	//@Autowired
	private ClassB b;
	
	public ClassA() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constr...");
	}

	@Autowired
	public ClassA(ClassB b) 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using args constr...");
		this.b = b;
	}

	public ClassB getB() {
		return b;
	}

	//@Autowired
	public void setB(ClassB b) {
		this.b = b;
	}

	@Override
	public String toString() {
		return "ClassA [b=" + b + "]";
	}
	
	
	
	
	
}
