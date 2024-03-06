package org.jspiders.setterinjectionforcollection;

import org.jspiders.setterinjectionforcollection.beans.CollectionType;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	ClassPathXmlApplicationContext context = 
    			new ClassPathXmlApplicationContext("setterInjectionforcollectionconfig.xml");
    	
    	CollectionType col = (CollectionType) context.getBean("col1");
    	
    	System.out.println(col);
    	
    	context.close();
    }
}
