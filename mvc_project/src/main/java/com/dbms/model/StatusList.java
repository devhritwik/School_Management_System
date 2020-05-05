package com.dbms.model;

import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class StatusList{
	
	private List<HomeworkOfStudent> status;
	
	public StatusList() {
			
	}

	public List<HomeworkOfStudent> getStatus() {
		return status;
	}

	public void setStatus(List<HomeworkOfStudent> status) {
		this.status = status;
	}
	
	

}
