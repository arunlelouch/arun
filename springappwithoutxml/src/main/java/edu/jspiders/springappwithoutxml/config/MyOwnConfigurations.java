package edu.jspiders.springappwithoutxml.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import edu.jspiders.springappwithoutxml.beans.ClassA;
import edu.jspiders.springappwithoutxml.beans.ClassB;
import edu.jspiders.springappwithoutxml.beans.ClassC;

@Configuration
@ComponentScan(basePackages="edu.jspiders.springappwithoutxml.beans")
public class MyOwnConfigurations 
{
	/*@Bean
	public ClassA getClassA()
	{
		return new ClassA();
	}
	
	@Bean
	public ClassB getClassB()
	{
		return new ClassB();
	}
	
	@Bean
	public ClassC getClassC()
	{
		return new ClassC();
	}*/
}
