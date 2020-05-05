package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Teacher{

	private String teacherID;
	@Size(max=30)
	private String firstName;
	@Size(max=30)
	private String middleName;
	@Size(max=30)
	private String lastName;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past
	private Date DOB;
	@Pattern(regexp="[0-9]*",message="Invalid! Mobile Number should consist of digits only")
	private String mobNo;
	@Email(message="Invalid e-mail")
	private String email;
	@Size(max=30)
	private String houseNo;
	@Size(max=30)
	private String street;
	@Size(max=30)
	private String locality;
	@Size(max=30)
	private String city;
	@Size(max=30)
	private String state;
	@Pattern(regexp="[0-9]*",message="Invalid! Pincode should consist of digits only")
	private String pincode;
	@Pattern(regexp="(^$|[0-9]{12})",message="Invalid! Aadhar No should consist of 12 digits")
	private String aadharNo;
	@Range(min=0,max=10000000)
	private Double salary;
	private String maritalStatus;
	private String qualification;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past
	private Date joinDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date resignDate;
	
	public Teacher() {
			
	}

	public Teacher(String teacherID, String firstName, String middleName, String lastName, String gender, Date dOB,
			String mobNo, String email, String houseNo, String street, String locality, String city, String state,
			String pincode, String aadharNo, Double salary, String maritalStatus, String qualification, Date joinDate,
			Date resignDate) {
		
		this.teacherID = teacherID;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.gender = gender;
		DOB = dOB;
		this.mobNo = mobNo;
		this.email = email;
		this.houseNo = houseNo;
		this.street = street;
		this.locality = locality;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.aadharNo = aadharNo;
		this.salary = salary;
		this.maritalStatus = maritalStatus;
		this.qualification = qualification;
		this.joinDate = joinDate;
		this.resignDate = resignDate;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
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

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
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

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
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
