package com.dbms.model;

import java.util.Date;

import javax.validation.constraints.Size;

import java.sql.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Bill{
	@Range(min=0,max=10000000)
	private Integer billNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	@Size(max=30)
	private String ofStudent;
	@Range(min=0,max=10000000,message="Enter a real number.")
	private Double amount;
	@Range(min=0,max=10000000,message="Enter a real number.")
	private Double concession;
	@Range(min=0,max=10000000,message="Enter a real number.")
	private Double fine;
	@Size(max=30)
	private String feePeriod;
	@Size(max=30)
	private String status;
	@Size(max=30)
	private String throughAccountant;
	
	public Bill() {
			
	}

	public Bill(Integer billNo, Date date, String ofStudent, Double amount, Double concession, Double fine,
			String feePeriod, String status, String throughAccountant) {
		
		this.billNo = billNo;
		this.date = date;
		this.ofStudent = ofStudent;
		this.amount = amount;
		this.concession = concession;
		this.fine = fine;
		this.feePeriod = feePeriod;
		this.status = status;
		this.throughAccountant = throughAccountant;
	}

	public Integer getBillNo() {
		return billNo;
	}

	public void setBillNo(Integer billNo) {
		this.billNo = billNo;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getOfStudent() {
		return ofStudent;
	}

	public void setOfStudent(String ofStudent) {
		this.ofStudent = ofStudent;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Double getConcession() {
		return concession;
	}

	public void setConcession(Double concession) {
		this.concession = concession;
	}

	public Double getFine() {
		return fine;
	}

	public void setFine(Double fine) {
		this.fine = fine;
	}

	public String getFeePeriod() {
		return feePeriod;
	}

	public void setFeePeriod(String feePeriod) {
		this.feePeriod = feePeriod;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getThroughAccountant() {
		return throughAccountant;
	}

	public void setThroughAccountant(String throughAccountant) {
		this.throughAccountant = throughAccountant;
	}
	
	
}
