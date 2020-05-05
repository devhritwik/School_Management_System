package com.dbms.model;

import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MarksList{
	
	private List<MarksInExam> marks;
	
	public MarksList() {
			
	}
	
	public List<MarksInExam> getMarks() {
		return marks;
	}

	public void setMarks(List<MarksInExam> marks) {
		this.marks = marks;
	}

}
