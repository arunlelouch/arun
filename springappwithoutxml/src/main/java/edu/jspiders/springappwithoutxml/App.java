package edu.jspiders.springappwithoutxml;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import edu.jspiders.springappwithoutxml.beans.ClassA;
import edu.jspiders.springappwithoutxml.config.MyOwnConfigurations;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	AnnotationConfigApplicationContext context =
    			new AnnotationConfigApplicationContext(MyOwnConfigurations.class);
    	
    	ClassA a = context.getBean(ClassA.class);
    	
    	context.close();
    }
}
