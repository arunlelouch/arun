package org.jspiders.setterInjectionforpdtandstring;

import org.jspiders.setterInjectionforpdtandstring.beans.Student;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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
    			new ClassPathXmlApplicationContext("setterInjectionconfig.xml");
    	
    	//2.get the beans 
    	Student stu1 = (Student) context.getBean("s1");
    	Student stu2 = (Student) context.getBean("s2");
    	
    	//3.Use the beans
    	System.out.println(stu1);
    	System.out.println(stu2);
    	
    	
    	//4.Close the container
    	context.close();
    }
}
