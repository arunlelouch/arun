package edu.jspiders.baenscope.beans;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class ClassB
{
	public ClassB() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created!!");
	}
}
