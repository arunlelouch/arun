package edu.jspiders.explicitbeanwiringdemo;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jspiders.explicitbeanwiringdemo.beans.ClassA;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	//1.Create the container
    	ClassPathXmlApplicationContext context = 
    			new ClassPathXmlApplicationContext("explictwiringconfig.xml");
    	
    	//2.get the beans 
    	ClassA a = (ClassA) context.getBean("a1");
    	
    	//3.Use the beans
    	System.out.println(a);
    	
    	
    	//4.Close the container
    	context.close();
    }
}
