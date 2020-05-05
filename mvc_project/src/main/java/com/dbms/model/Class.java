package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Class{
	@Size(max=30)
	private String classID;
	@Size(max=30)
	private String className;
	@Size(max=30)
	private String roomNo;
	
	
	public Class() {
			
	}


	public Class(String classID, String className, String roomNo) {
		this.classID = classID;
		this.className = className;
		this.roomNo = roomNo;
	}


	public String getClassID() {
		return classID;
	}


	public void setClassID(String classID) {
		this.classID = classID;
	}


	public String getClassName() {
		return className;
	}


	public void setClassName(String className) {
		this.className = className;
	}


	public String getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	
}
