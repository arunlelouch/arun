package edu.jspiders.autowiringusingannotations.beans;

public class ClassB
{
	private int x;
	
	public ClassB() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constr...");
	}

	public ClassB(int x) 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using args constr...");
		this.x = x;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	@Override
	public String toString() {
		return "ClassB [x=" + x + "]";
	}
	
	
	
}
