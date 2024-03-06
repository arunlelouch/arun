package edu.jspiders.autowiringusingxml.beans;

public class ClassA 
{
	private ClassB b;
	
	public ClassA() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args Constr..!!");
	}
	
	

	public ClassA(ClassB b)
	{
		super();
		System.out.println(this.getClass().getSimpleName()+" Object is created using args Constr..!!");
		this.b = b;
	}



	public ClassB getB() {
		return b;
	}

	public void setB(ClassB b) {
		this.b = b;
	}

	@Override
	public String toString() {
		return "ClassA [b=" + b + "]";
	}
	
	
}
