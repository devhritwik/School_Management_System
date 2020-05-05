package com.dbms.model;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Attendance{
	@NotEmpty(message="required")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	@NotEmpty(message="required")
	private Integer periodNo;
	@NotEmpty(message="required")
	private String studentID;
	private String status;
	
	public Attendance() {
			
	}

	public Attendance(Date date, Integer periodNo, String studentID, String status) {
		super();
		this.date = date;
		this.periodNo = periodNo;
		this.studentID = studentID;
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getPeriodNo() {
		return periodNo;
	}

	public void setPeriodNo(Integer periodNo) {
		this.periodNo = periodNo;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
