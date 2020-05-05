package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.NotBlank;

public class Student{

	@Size(max=30)
	private String studentID;
	@Size(max=30)
	private String firstName;
	@Size(max=30)
	private String middleName;
	@Size(max=30)
	private String lastName;
	@Size(max=30)
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past
	private Date DOB;
	@Pattern(regexp="[0-9]*",message="Invalid! Mobile Number should consist of digits only")
	@Size(max=30)
	private String mobNo;
	@Email(message="Invalid e-mail")
	@Size(max=30)
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
	@Size(max=30)
	@Pattern(regexp="[0-9]*",message="Invalid! Pincode should consist of digits only")
	private String pincode;
	private String parentID;
	private String classID;
	@Size(max=30)
	private String bloodGp;
	@Range(min=0,max=1000000)
	private Integer admissionYear;
	@Pattern(regexp="(^$|[0-9]{12})",message="Invalid! Aadhar No should consist of 12 digits")
	private String aadharNo;
	@Size(max=30)
	private String category;
	
	public Student() {
			
	}

	public Student(String studentID, String firstName, String middleName, String lastName, String gender, Date dOB,
			String mobNo, String email, String houseNo, String street, String locality, String city, String state,
			String pincode, String parentID, String classID, String bloodGp, Integer admissionYear, String aadharNo,
			String category) {
		
		this.studentID = studentID;
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
		this.parentID = parentID;
		this.classID = classID;
		this.bloodGp = bloodGp;
		this.admissionYear = admissionYear;
		this.aadharNo = aadharNo;
		this.category = category;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
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

	public String getParentID() {
		return parentID;
	}

	public void setParentID(String parentID) {
		this.parentID = parentID;
	}

	public String getClassID() {
		return classID;
	}

	public void setClassID(String classID) {
		this.classID = classID;
	}

	public String getBloodGp() {
		return bloodGp;
	}

	public void setBloodGp(String bloodGp) {
		this.bloodGp = bloodGp;
	}

	public Integer getAdmissionYear() {
		return admissionYear;
	}

	public void setAdmissionYear(Integer admissionYear) {
		this.admissionYear = admissionYear;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
