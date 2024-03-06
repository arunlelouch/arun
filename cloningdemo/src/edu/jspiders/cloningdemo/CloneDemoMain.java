package edu.jspiders.cloningdemo;

public class CloneDemoMain 
{
	public static void main(String[] args) throws CloneNotSupportedException
	{
		Test t = new Test(10, 20);
		
		Test copyt = (Test) t.clone();
		
		t.x = 100;
		
		System.out.println(t);
		System.out.println(copyt);
		
		/*Test t1 = t;
		System.out.println(t1);*/
		
		
	}
}
