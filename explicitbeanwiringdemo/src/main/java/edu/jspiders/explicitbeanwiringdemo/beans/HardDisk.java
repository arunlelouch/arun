package edu.jspiders.explicitbeanwiringdemo.beans;

public class HardDisk
{
	private String brand;
	private double price;
	
	public HardDisk() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor!!!");
	}
	
	public HardDisk(String brand, double price)
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
		return "HardDisk [brand=" + brand + ", price=" + price + "]";
	}
	
	
}
