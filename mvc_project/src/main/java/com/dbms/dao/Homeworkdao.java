package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Parent;
import com.dbms.model.Student;
import com.dbms.model.Teacher;
import com.dbms.model.Homework;
import com.dbms.model.HomeworkOfStudent;
import com.dbms.model.HomeworkWithStatus;

public interface Homeworkdao{
	@Autowired
	public void saveOrUpdate(Homework homework);
	public void insertHomeworkByTeacher(Homework homework, String teacherID);
	public void insertHomeworkOfStudent(Homework homework, String studentID);
	public void insertHomeworkOfStudentStatus(HomeworkOfStudent homework);
	public void deleteHomeworkOfStudent(String homeworkID, String studentID);
	public void delete(String homeworkID);
	public List<Homework> getAll();
	public Homework getHomework(String homeworkID);
	public List<Homework> getHomeworksByStudent(String studentID);
	public List<HomeworkWithStatus> getHomeworksByStudentStatus(String studentID);
	public int getHomeworkCountByStudent(String studentID);
	public List<Homework> getHomeworksByTeacher(String teacherID);
	public int getHomeworkCountByTeacher(String teacherID);
	public List<HomeworkOfStudent> getStudentsByTeacherHomework(String teacherID, String homeworkID);
	public int getStudentCountByTeacherHomework(String teacherID);
	public int getCount();
}