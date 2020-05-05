package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Subject{
	@Size(max=30)
	private String subjectCode;
	@Size(max=90)
	private String subjectName;
	@Size(max=30)
	private String forClass;
	@Size(max=30)
	private String gradedOrNot;
	@Size(max=90)
	private String bookName;
	@Size(max=90)
	private String bookPublication;
	@Range(min=0,max=10000,message="Enter a real number between 0 and 10000.")
	private Double bookPrice;
	@Size(max=30)
	private String notebookType;	
	
	public Subject() {
			
	}

	public Subject(String subjectCode, String subjectName, String forClass, String gradedOrNot, String bookName,
			String bookPublication, Double bookPrice, String notebookType) {
		
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.forClass = forClass;
		this.gradedOrNot = gradedOrNot;
		this.bookName = bookName;
		this.bookPublication = bookPublication;
		this.bookPrice = bookPrice;
		this.notebookType = notebookType;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getForClass() {
		return forClass;
	}

	public void setForClass(String forClass) {
		this.forClass = forClass;
	}

	public String getGradedOrNot() {
		return gradedOrNot;
	}

	public void setGradedOrNot(String gradedOrNot) {
		this.gradedOrNot = gradedOrNot;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookPublication() {
		return bookPublication;
	}

	public void setBookPublication(String bookPublication) {
		this.bookPublication = bookPublication;
	}

	public Double getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getNotebookType() {
		return notebookType;
	}

	public void setNotebookType(String notebookType) {
		this.notebookType = notebookType;
	}
	
}
