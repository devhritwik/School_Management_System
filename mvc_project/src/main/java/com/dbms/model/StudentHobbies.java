package com.dbms.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class StudentHobbies{
	@Size(max=30)
	private String studentID;
	@Size(max=30)
	private String hobby;
	
	public StudentHobbies() {
			
	}

	public StudentHobbies(String studentID, String hobby) {
		this.studentID = studentID;
		this.hobby = hobby;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
}
