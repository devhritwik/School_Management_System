package com.dbms.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class StudentLanguages{
	@Size(max=30)
	private String studentID;
	@Size(max=30)
	private String language;
	
	public StudentLanguages() {
			
	}

	public StudentLanguages(String studentID, String language) {
		
		this.studentID = studentID;
		this.language = language;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
}
