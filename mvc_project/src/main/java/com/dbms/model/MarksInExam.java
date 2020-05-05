package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import java.sql.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class MarksInExam{
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String date;
	@Size(max=30)
	private String type;
	@Size(max=30)
	private String subjectCode;
	@Size(max=30)
	private String studentID;
	@Range(min=-10000000,max=10000000,message="Enter a real number.")
	private Double marksObtained;
	
	public MarksInExam() {
			
	}

	public MarksInExam(String date, String type, String subjectCode, String studentID, Double marksObtained) {
		
		this.date = date;
		this.type = type;
		this.subjectCode = subjectCode;
		this.studentID = studentID;
		this.marksObtained = marksObtained;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public Double getMarksObtained() {
		return marksObtained;
	}

	public void setMarksObtained(Double marksObtained) {
		this.marksObtained = marksObtained;
	}

	
	
}
