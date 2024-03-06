package edu.jspiders.explicitbeanwiringdemo.beans;

public class ClassB
{
	private int m;

	public ClassB() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor");
	}

	public int getM() {
		return m;
	}

	public void setM(int m) {
		this.m = m;
	}

	@Override
	public String toString() {
		return "ClassB [m=" + m + "]";
	}


}
