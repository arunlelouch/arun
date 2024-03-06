package org.jspiders.setterInjectionforpdtandstring.beans;

public class Student 
{
	private int studentId;
	private String name;
	private Double marks;
	
	public Student() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor!!");
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getMarks() {
		return marks;
	}

	public void setMarks(Double marks) {
		this.marks = marks;
	}

	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", name=" + name + ", marks=" + marks + "]";
	}
	
	
}
