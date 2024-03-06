package edu.jspiders.autowiringusingxml;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jspiders.autowiringusingxml.beans.ClassA;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	
    	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("autowiringconfig.xml");
    	
    	ClassA a = (ClassA) context.getBean("a");
    	
    	System.out.println(a);
    	
    	context.close();
    }
}
