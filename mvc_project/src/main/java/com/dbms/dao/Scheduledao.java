package com.dbms.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Schedule;

public interface Scheduledao{
	@Autowired
	public void editSchedule(Schedule schedule);
	public void insertSchedule(Schedule schedule);
	public void delete(String day, Integer periodNo, String classID, String teacherID, String subjectCode);
	public List<Schedule> getAll();
	public Schedule getSchedule(String day, Integer periodNo, String classID, String teacherID, String subjectCode);
	public List<Schedule> getScheduleByDay(String day);
	public List<Schedule> getScheduleByStudent(String studentID);
	public List<Schedule> getScheduleByTeacher(String teacherID);
	public List<Schedule> getScheduleByClass(String classID);
	public List<Schedule> getScheduleBySubject(String subjectCode);
	
//	public int getScheduleCountByStudent(String studentID);
//	public List<Schedule> getSchedulesByTeacher(String teacherID);
//	public int getScheduleCountByTeacher(String teacherID);
//	public List<Schedule> getSchedulesByParent(String parentID);
//	public int getScheduleCountByParent(String parentID);
//	public int getCount();
}