package edu.jspiders.cloningdemo.deepcopy;

public class Address implements Cloneable
{
	int houseNumber;
	String streetName;
	int pinCode;
	
	public Address(int houseNumber, String streetName, int pinCode) {
		this.houseNumber = houseNumber;
		this.streetName = streetName;
		this.pinCode = pinCode;
	}

	@Override
	public String toString() {
		return "Address [houseNumber=" + houseNumber + ", streetName=" + streetName + ", pinCode=" + pinCode + "]";
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	
	
}
