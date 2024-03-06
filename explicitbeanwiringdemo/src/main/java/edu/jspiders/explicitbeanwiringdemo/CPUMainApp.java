package edu.jspiders.explicitbeanwiringdemo;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.jspiders.explicitbeanwiringdemo.beans.CPU;

public class CPUMainApp {

	public static void main(String[] args)
	{
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("cpuconfig.xml");
		
		CPU cpu = (CPU) context.getBean("cpu");
		
		System.out.println(cpu);
		
		context.close();

	}

}
