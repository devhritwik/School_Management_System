package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class HomeworkOfStudent{
	@Range(min=0,max=10000000)
	private Integer homeworkID;
	private String studentID;
	@Size(max=30)
	private String status;
	
	public HomeworkOfStudent() {
			
	}

	public HomeworkOfStudent(Integer homeworkID, String studentID, String status) {
		
		this.homeworkID = homeworkID;
		this.studentID = studentID;
		this.status = status;
	}

	public Integer getHomeworkID() {
		return homeworkID;
	}

	public void setHomeworkID(Integer homeworkID) {
		this.homeworkID = homeworkID;
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
