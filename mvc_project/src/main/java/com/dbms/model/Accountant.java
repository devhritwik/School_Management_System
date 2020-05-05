package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Accountant{
	@Size(max=30)
	private String accountantID;
	@Size(max=30)
	private String firstName;
	@Size(max=30)
	private String middleName;
	@Size(max=30)
	private String lastName;
	@Size(max=30)
	private String gender;
	@Pattern(regexp="[0-9]*",message="Invalid! Mobile Number should consist of digits only")
	@Size(max=30)
	private String mobNo;
	@Email(message="Invalid e-mail")
	@Size(max=30)
	private String email;
	@Size(max=30)
	private String workType;
	@Range(min=0,max=1000000)
	private Double salary;
	@Pattern(regexp="(^$|[0-9]{12})",message="Invalid! Aadhar No should consist of 12 digits")
	private String aadharNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past
	private Date joinDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date resignDate;
	
	public Accountant() {
			
	}

	public Accountant(String accountantID, String firstName, String middleName, String lastName, String gender,
			String mobNo, String email, String workType, Double salary, String aadharNo, Date joinDate,
			Date resignDate) {
		
		this.accountantID = accountantID;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.gender = gender;
		this.mobNo = mobNo;
		this.email = email;
		this.workType = workType;
		this.salary = salary;
		this.aadharNo = aadharNo;
		this.joinDate = joinDate;
		this.resignDate = resignDate;
	}

	public String getAccountantID() {
		return accountantID;
	}

	public void setAccountantID(String accountantID) {
		this.accountantID = accountantID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getResignDate() {
		return resignDate;
	}

	public void setResignDate(Date resignDate) {
		this.resignDate = resignDate;
	}
	
}
