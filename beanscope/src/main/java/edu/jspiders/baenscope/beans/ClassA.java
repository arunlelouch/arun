package edu.jspiders.baenscope.beans;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("singleton")
public class ClassA
{
	public ClassA() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created!!");
	}
}
