package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Report{
	@Range(min=0,max=1000000)
	private Integer reportID;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	@Size(max=30)
	private String topic;
	private String message;
	@Size(max=250)
	private String action;
	@Size(max=30)
	private String forStudent;
	@Size(max=30)
	private String byTeacher;
	
	public Report() {
			
	}

	public Report(Integer reportID, Date date, String topic, String message, String action, String forStudent,
			String byTeacher) {
		
		this.reportID = reportID;
		this.date = date;
		this.topic = topic;
		this.message = message;
		this.action = action;
		this.forStudent = forStudent;
		this.byTeacher = byTeacher;
	}

	public Integer getReportID() {
		return reportID;
	}

	public void setReportID(Integer reportID) {
		this.reportID = reportID;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getForStudent() {
		return forStudent;
	}

	public void setForStudent(String forStudent) {
		this.forStudent = forStudent;
	}

	public String getByTeacher() {
		return byTeacher;
	}

	public void setByTeacher(String byTeacher) {
		this.byTeacher = byTeacher;
	}

	
	
}
