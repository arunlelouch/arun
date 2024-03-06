package edu.jspiders.beanlifecycle.beans;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class ClassA implements InitializingBean,DisposableBean
{
	public ClassA()
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created!!!");
	}

	@Override
	public void afterPropertiesSet() throws Exception 
	{
		//initialization code
		System.out.println("in post initialization callback method!!");
	}

	@Override
	public void destroy() throws Exception
	{
		//clean up code
		System.out.println("in pre destruction call back method!!");
	}
	
	
	
}
