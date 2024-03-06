package edu.jspiders.explicitbeanwiringdemo.beans;

public class Ram
{
	private String brand;
	private double price;
	
	public Ram() 
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
		return "Ram [brand=" + brand + ", price=" + price + "]";
	}
	
	
}
