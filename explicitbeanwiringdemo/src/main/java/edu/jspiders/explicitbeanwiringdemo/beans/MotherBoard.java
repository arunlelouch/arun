package edu.jspiders.explicitbeanwiringdemo.beans;

public class MotherBoard
{
	private String brand;
	private double price;
	
	public MotherBoard() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor!!!");
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "MotherBoard [brand=" + brand + ", price=" + price + "]";
	}
	
	
}
