package edu.jspiders.beanlifecycle;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jspiders.beanlifecycle.beans.ClassA;
import edu.jspiders.beanlifecycle.beans.ClassB;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	ClassPathXmlApplicationContext context = 
    			new ClassPathXmlApplicationContext("lifecycleconfig.xml");
    	
//    	ClassA a = context.getBean(ClassA.class);
    	ClassB a = context.getBean(ClassB.class);
    	
    	System.out.println(a);
    	
    	context.close();
    }
}
