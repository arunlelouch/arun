package edu.jspiders.beanlifecycle.beans;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Component;

@Component
public class ClassB
{
	public ClassB() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created!!!");
	}
	
	@PostConstruct
	public void myOwnInit()
	{
		//initialization code
		System.out.println("in post initialization callback method!! of ClassB");
	}
	
	@PreDestroy
	public void myOwnDestroy()
	{
		//clean up code
		System.out.println("in pre destruction call back method!! of ClassB");
	}
}
