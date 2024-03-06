package edu.jspiders.springappwithoutxml.beans;

import org.springframework.stereotype.Component;

@Component
public class ClassA 
{
	public ClassA() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created!!!");
	}
}
