package org.jspiders.setterinjectionforcollection.beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class CollectionType
{
	private ArrayList<Integer> integerList;
	private HashSet<Double> doubleSet;
	private HashMap<Character, Integer> alphabetsMap;
	
	public CollectionType() 
	{
		System.out.println(this.getClass().getSimpleName()+" Object created using no-args constr...!!!");
	}

	public CollectionType(ArrayList<Integer> integerList, HashSet<Double> doubleSet,
			HashMap<Character, Integer> alphabetsMap) {
		System.out.println(this.getClass().getSimpleName()+" Object created using args constr...!!!");
		this.integerList = integerList;
		this.doubleSet = doubleSet;
		this.alphabetsMap = alphabetsMap;
	}

	public ArrayList<Integer> getIntegerList() {
		return integerList;
	}

	public void setIntegerList(ArrayList<Integer> integerList) {
		this.integerList = integerList;
	}

	public HashSet<Double> getDoubleSet() {
		return doubleSet;
	}

	public void setDoubleSet(HashSet<Double> doubleSet) {
		this.doubleSet = doubleSet;
	}

	public HashMap<Character, Integer> getAlphabetsMap() {
		return alphabetsMap;
	}

	public void setAlphabetsMap(HashMap<Character, Integer> alphabetsMap) {
		this.alphabetsMap = alphabetsMap;
	}

	@Override
	public String toString() {
		return "CollectionType [integerList=" + integerList + ", doubleSet=" + doubleSet + ", alphabetsMap="
				+ alphabetsMap + "]";
	}
	
	
	
}
