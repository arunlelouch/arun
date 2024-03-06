package edu.jspiders.autowiringusingannotations;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jspiders.autowiringusingannotations.beans.ClassA;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	ClassPathXmlApplicationContext context = 
    			new ClassPathXmlApplicationContext("autowiringusingannotationconfig.xml");
    	
    	ClassA a = (ClassA) context.getBean("classA");
    	
    	System.out.println(a);
    	
    	context.close();
    }
}
