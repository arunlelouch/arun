package edu.jspiders.cloningdemo;

public class Test implements Cloneable
{
	int x;
	int y;
	
	public Test(int x, int y)
	{
		this.x = x;
		this.y = y;
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException
	{
		return super.clone();
	}

	@Override
	public String toString() {
		return "Test [x=" + x + ", y=" + y + "]";
	}
	
	
	
}
