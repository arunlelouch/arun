package edu.jspiders.explicitbeanwiringdemo.beans;

public class Processor
{
	private String brand;
	private double price;
	
	public Processor() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor!!!");
	}
	
	

	public Processor(String brand, double price)
	{
		super();
		System.out.println(this.getClass().getSimpleName()+" Object is created using args constructor!!!");
		this.brand = brand;
		this.price = price;
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
		return "Processor [brand=" + brand + ", price=" + price + "]";
	}
	
	
}
