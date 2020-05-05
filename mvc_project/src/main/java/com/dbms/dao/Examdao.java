package com.dbms.dao;

import java.util.List;
import java.util.Date;
import java.sql.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Parent;
import com.dbms.model.Exam;
import com.dbms.model.MarksInExam;

public interface Examdao{
	@Autowired
	public void saveOrUpdate(Exam exam);
	public void insertExam(Exam exam);
	public void insertMarksInExam(MarksInExam marksInExam);
	public void deleteMarksInExam(String date, String type, String subjectCode);
	public void delete(Date date, String type, String subjectCode);
	public List<Exam> getAll();
	public Exam getExam(String date, String type, String subjectCode);
	public List<Exam> getExamsByStudent(String studentID);
	public int getExamCountByStudent(String studentID);
	public List<MarksInExam> getMarksInExams(String studentID);
	public List<MarksInExam> getAllMarksByExam(String date, String type, String subjectCode);
	public List<Exam> getExamsByTeacher(String teacherID);
	public int getExamCountByTeacher(String teacherID);
	public int getCount();
}