package edu.jspiders.explicitbeanwiringdemo.beans;

public class ClassA 
{
	private int x;
	private ClassB b;
	
	public ClassA() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor");
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public ClassB getB() {
		return b;
	}

	public void setB(ClassB b) {
		this.b = b;
	}

	@Override
	public String toString() {
		return "ClassA [x=" + x + ", b=" + b + "]";
	}
	
	
}
