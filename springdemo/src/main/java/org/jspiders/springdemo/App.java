package org.jspiders.springdemo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        /*Test1 t1 = new Test1();
        t1.m1();*/
    	
    	//1.Create the container
    	ApplicationContext context = new ClassPathXmlApplicationContext("springconfig.xml");
    	
    	//2.Get the Beans
    	Object obj = context.getBean("test1");
    	Test1 t1 = (Test1) obj;
    	
    	//3.Use the Beans
    	t1.m1();       
    	
    	
    }
}
