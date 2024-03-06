package edu.jspiders.explicitbeanwiringdemo.beans;

public class CPU 
{
	private MotherBoard mb;
	private Ram ram;
	private Processor pro;
	private HardDisk hd;
	
	public CPU() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object is created using no-args constructor!!!");
	}

	public CPU(MotherBoard mb, Ram ram, Processor pro, HardDisk hd) 
	{
		super();
		System.out.println(this.getClass().getSimpleName()+" Object is created using args constructor!!!");
		this.mb = mb;
		this.ram = ram;
		this.pro = pro;
		this.hd = hd;
	}

	public MotherBoard getMb() {
		return mb;
	}

	public void setMb(MotherBoard mb) {
		this.mb = mb;
	}

	public Ram getRam() {
		return ram;
	}

	public void setRam(Ram ram) {
		this.ram = ram;
	}

	public Processor getPro() {
		return pro;
	}

	public void setPro(Processor pro) {
		this.pro = pro;
	}

	public HardDisk getHd() {
		return hd;
	}

	public void setHd(HardDisk hd) {
		this.hd = hd;
	}

	@Override
	public String toString() {
		return "CPU [mb=" + mb + ", ram=" + ram + ", pro=" + pro + ", hd=" + hd + "]";
	}
	
	
	
	
}
