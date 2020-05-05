package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Schedule{
	@Size(max=30)
	private String day;
	@Range(min=0,max=20,message="Enter an integer between 0 and 20.")
	private Integer periodNo;
	@Size(max=30)
	private String classID;
	@Size(max=30)
	private String teacherID;
	@Size(max=30)
	private String subjectCode;
	
	public Schedule() {
			
	}

	public Schedule(String day, Integer periodNo, String classID, String teacherID, String subjectCode) {

		this.day = day;
		this.periodNo = periodNo;
		this.classID = classID;
		this.teacherID = teacherID;
		this.subjectCode = subjectCode;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Integer getPeriodNo() {
		return periodNo;
	}

	public void setPeriodNo(Integer periodNo) {
		this.periodNo = periodNo;
	}

	public String getClassID() {
		return classID;
	}

	public void setClassID(String classID) {
		this.classID = classID;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	
}
