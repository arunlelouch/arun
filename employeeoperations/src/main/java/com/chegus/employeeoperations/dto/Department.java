package com.chegus.employeeoperations.dto;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="department")
public class Department {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer deptId;
	
	@Column(name="dept_Name ") 
	private String deptName;
	@Column(name="dept_Type ") 
	private String deptType;
	@Column(name="dept_Location ")
	private String deptLoc;
	@Column(name="dept_Manager ")
	private String deptManager;
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	private Employee employee;

	public Department() {
		
	}

	public Department(Integer deptId, String deptName, String deptType, String deptLoc, String deptManager,
			Employee employee) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
		this.deptType = deptType;
		this.deptLoc = deptLoc;
		this.deptManager = deptManager;
		this.employee = employee;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptType() {
		return deptType;
	}

	public void setDeptType(String deptType) {
		this.deptType = deptType;
	}

	public String getDeptLoc() {
		return deptLoc;
	}

	public void setDeptLoc(String deptLoc) {
		this.deptLoc = deptLoc;
	}

	public String getDeptManager() {
		return deptManager;
	}

	public void setDeptManager(String deptManager) {
		this.deptManager = deptManager;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "["+deptId+ " " + deptName + "]";
	}

	/*@Override
	public String toString() {
		return "Department [deptId=" + deptId + ", deptName=" + deptName + ", deptType=" + deptType + ", deptLoc="
				+ deptLoc + ", deptManager=" + deptManager + ", employee=" + employee + (employee != null ? employee.getId() : "not initialized") + "]";
	}*/
	
	

}