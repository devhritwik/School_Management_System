package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import java.sql.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Exam{
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	@Size(max=30)
	private String type;
	@Size(max=30)
	private String subjectCode;
	private Time time;
	@Size(max=30)
	private String roomNo;
	@Range(min=0,max=10000000,message="Enter a non negative real number.")
	private Double maxMarks;
	
	public Exam() {
			
	}

	public Exam(Date date, String type, String subjectCode, Time time, String roomNo, Double maxMarks) {
		super();
		this.date = date;
		this.type = type;
		this.subjectCode = subjectCode;
		this.time = time;
		this.roomNo = roomNo;
		this.maxMarks = maxMarks;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
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

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public Double getMaxMarks() {
		return maxMarks;
	}

	public void setMaxMarks(Double maxMarks) {
		this.maxMarks = maxMarks;
	}
	
}
