package edu.jspiders.cloningdemo.shallowcopy;

public class Address 
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
	
	
}
