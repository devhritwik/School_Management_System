package com.dbms.model;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Homework{
	@Range(min=0,max=10000000)
	private Integer homeworkID;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	@Range(min=0,max=10000000,message="Enter a non negative real number.")
	private Integer maxMarks;
	private String byTeacher;	
	private String subjectCode;
	
	public Homework() {
			
	}

	public Homework(Integer homeworkID, Date date, Integer maxMarks, String byTeacher, String subjectCode) {
		
		this.homeworkID = homeworkID;
		this.date = date;
		this.maxMarks = maxMarks;
		this.byTeacher = byTeacher;
		this.subjectCode = subjectCode;
	}

	public Integer getHomeworkID() {
		return homeworkID;
	}

	public void setHomeworkID(Integer homeworkID) {
		this.homeworkID = homeworkID;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getMaxMarks() {
		return maxMarks;
	}

	public void setMaxMarks(Integer maxMarks) {
		this.maxMarks = maxMarks;
	}

	public String getByTeacher() {
		return byTeacher;
	}

	public void setByTeacher(String byTeacher) {
		this.byTeacher = byTeacher;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	
}
