package com.dbms.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Parent;
import com.dbms.model.Attendance;

//date date, periodNo int, studentId varchar(40), status varchar(40), primary key(date,periodNo,studentId)
public interface Attendancedao{
	@Autowired
	public void saveOrUpdate(Attendance attendance);
	public void insertAttendance(Attendance attendance);
	public void delete(String date, String periodNo, String studentID);
	public void delete1(Date date, String periodNo, String studentID);
	public List<Attendance> getAll();
	public List<Attendance> getAttendanceByDate(Date date);
	public List<Attendance> getAttendanceByStudent(String studentID);
	public List<Attendance> getAttendanceByDatePeriod(Date date, String periodNo);
	
//	public int getAttendanceCountByStudent(String studentID);
//	public List<Attendance> getAttendancesByTeacher(String teacherID);
//	public int getAttendanceCountByTeacher(String teacherID);
//	public List<Attendance> getAttendancesByParent(String parentID);
//	public int getAttendanceCountByParent(String parentID);
//	public int getCount();
}