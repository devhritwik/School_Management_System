package com.dbms.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class TeacherLanguages{
	@Size(max=30)
	private String teacherID;
	@Size(max=30)
	private String language;
	
	public TeacherLanguages() {
			
	}

	public TeacherLanguages(String teacherID, String language) {
		
		this.teacherID = teacherID;
		this.language = language;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
}
