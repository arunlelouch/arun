package edu.jspiders.baenscope;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jspiders.baenscope.beans.ClassA;
import edu.jspiders.baenscope.beans.ClassB;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("scopeconfig.xml");
    	
    	ClassA a1 = (ClassA) context.getBean("classA");
    	ClassA a2 = (ClassA) context.getBean("classA");
    	ClassA a3 = (ClassA) context.getBean("classA");
    	ClassA a4 = (ClassA) context.getBean("classA");
    	
    	System.out.println(a1);
    	System.out.println(a2);
    	System.out.println(a3);
    	System.out.println(a4);
    	
    	ClassB b1 = (ClassB) context.getBean("classB");
    	ClassB b2 = (ClassB) context.getBean("classB");
    	ClassB b3 = (ClassB) context.getBean("classB");
    	ClassB b4 = (ClassB) context.getBean("classB");
    	
    	System.out.println(b1);
    	System.out.println(b2);
    	System.out.println(b3);
    	System.out.println(b4);
    	
    	context.close();
    }
}
