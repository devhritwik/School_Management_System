package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Parent{

	@Size(max=30)
	private String parentID;
	@Size(max=30)
	private String fatherFirstName;
	@Size(max=30)
	private String fatherMiddleName;
	@Size(max=30)
	private String fatherLastName;
	@Size(max=30)
	private String motherFirstName;
	@Size(max=30)
	private String motherMiddleName;
	@Size(max=30)
	private String motherLastName;
	@Size(max=30)
	@Pattern(regexp="[0-9]*",message="Invalid! Mobile Number should consist of digits only")
	private String fatherMobNo;
	@Size(max=30)
	@Pattern(regexp="[0-9]*",message="Invalid! Mobile Number should consist of digits only")
	private String motherMobNo;
	@Size(max=30)
	@Email(message="Invalid e-mail")
	private String fatherEmail;
	@Size(max=30)
	@Email(message="Invalid e-mail")
	private String motherEmail;
	@Size(max=30)
	private String fatherProfession;
	@Size(max=30)
	private String motherProfession;
	@Range(min=0,max=1000000000,message="Enter a positive real number.")
	private Double fatherSalary;
	@Range(min=0,max=1000000000,message="Enter a positive real number.")
	private Double motherSalary;
	@Pattern(regexp="(^$|[0-9]{12})",message="Invalid! Aadhar No should consist of 12 digits")
	private String fatherAadharNo;
	@Pattern(regexp="(^$|[0-9]{12})",message="Invalid! Aadhar No should consist of 12 digits")
	private String motherAadharNo;
	@Size(max=30)
	private String fatherQualification;
	@Size(max=30)
	private String motherQualification;
	
	public Parent() {
			
	}

	public Parent(String parentID, String fatherFirstName, String fatherMiddleName, String fatherLastName,
			String motherFirstName, String motherMiddleName, String motherLastName, String fatherMobNo,
			String motherMobNo, String fatherEmail, String motherEmail, String fatherProfession,
			String motherProfession, Double fatherSalary, Double motherSalary, String fatherAadharNo,
			String motherAadharNo, String fatherQualification, String motherQualification) {
		
		this.parentID = parentID;
		this.fatherFirstName = fatherFirstName;
		this.fatherMiddleName = fatherMiddleName;
		this.fatherLastName = fatherLastName;
		this.motherFirstName = motherFirstName;
		this.motherMiddleName = motherMiddleName;
		this.motherLastName = motherLastName;
		this.fatherMobNo = fatherMobNo;
		this.motherMobNo = motherMobNo;
		this.fatherEmail = fatherEmail;
		this.motherEmail = motherEmail;
		this.fatherProfession = fatherProfession;
		this.motherProfession = motherProfession;
		this.fatherSalary = fatherSalary;
		this.motherSalary = motherSalary;
		this.fatherAadharNo = fatherAadharNo;
		this.motherAadharNo = motherAadharNo;
		this.fatherQualification = fatherQualification;
		this.motherQualification = motherQualification;
	}

	public String getParentID() {
		return parentID;
	}

	public void setParentID(String parentID) {
		this.parentID = parentID;
	}

	public String getFatherFirstName() {
		return fatherFirstName;
	}

	public void setFatherFirstName(String fatherFirstName) {
		this.fatherFirstName = fatherFirstName;
	}

	public String getFatherMiddleName() {
		return fatherMiddleName;
	}

	public void setFatherMiddleName(String fatherMiddleName) {
		this.fatherMiddleName = fatherMiddleName;
	}

	public String getFatherLastName() {
		return fatherLastName;
	}

	public void setFatherLastName(String fatherLastName) {
		this.fatherLastName = fatherLastName;
	}

	public String getMotherFirstName() {
		return motherFirstName;
	}

	public void setMotherFirstName(String motherFirstName) {
		this.motherFirstName = motherFirstName;
	}

	public String getMotherMiddleName() {
		return motherMiddleName;
	}

	public void setMotherMiddleName(String motherMiddleName) {
		this.motherMiddleName = motherMiddleName;
	}

	public String getMotherLastName() {
		return motherLastName;
	}

	public void setMotherLastName(String motherLastName) {
		this.motherLastName = motherLastName;
	}

	public String getFatherMobNo() {
		return fatherMobNo;
	}

	public void setFatherMobNo(String fatherMobNo) {
		this.fatherMobNo = fatherMobNo;
	}

	public String getMotherMobNo() {
		return motherMobNo;
	}

	public void setMotherMobNo(String motherMobNo) {
		this.motherMobNo = motherMobNo;
	}

	public String getFatherEmail() {
		return fatherEmail;
	}

	public void setFatherEmail(String fatherEmail) {
		this.fatherEmail = fatherEmail;
	}

	public String getMotherEmail() {
		return motherEmail;
	}

	public void setMotherEmail(String motherEmail) {
		this.motherEmail = motherEmail;
	}

	public String getFatherProfession() {
		return fatherProfession;
	}

	public void setFatherProfession(String fatherProfession) {
		this.fatherProfession = fatherProfession;
	}

	public String getMotherProfession() {
		return motherProfession;
	}

	public void setMotherProfession(String motherProfession) {
		this.motherProfession = motherProfession;
	}

	public Double getFatherSalary() {
		return fatherSalary;
	}

	public void setFatherSalary(Double fatherSalary) {
		this.fatherSalary = fatherSalary;
	}

	public Double getMotherSalary() {
		return motherSalary;
	}

	public void setMotherSalary(Double motherSalary) {
		this.motherSalary = motherSalary;
	}

	public String getFatherAadharNo() {
		return fatherAadharNo;
	}

	public void setFatherAadharNo(String fatherAadharNo) {
		this.fatherAadharNo = fatherAadharNo;
	}

	public String getMotherAadharNo() {
		return motherAadharNo;
	}

	public void setMotherAadharNo(String motherAadharNo) {
		this.motherAadharNo = motherAadharNo;
	}

	public String getFatherQualification() {
		return fatherQualification;
	}

	public void setFatherQualification(String fatherQualification) {
		this.fatherQualification = fatherQualification;
	}

	public String getMotherQualification() {
		return motherQualification;
	}

	public void setMotherQualification(String motherQualification) {
		this.motherQualification = motherQualification;
	}
	
}
