package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Parent;
import com.dbms.model.Report;

public interface Reportdao{
	@Autowired
	public void saveOrUpdateByAdmin(Report report);
	public void insertReportByTeacher(Report report, String teacherID);
	public void delete(String reportID);
	public List<Report> getAll();
	public Report getReport(String reportID);
	public List<Report> getReportsByStudent(String studentID);
	public int getReportCountByStudent(String studentID);
	public List<Report> getReportsByTeacher(String teacherID);
	public int getReportCountByTeacher(String teacherID);
	public List<Report> getReportsByParent(String parentID);
	public int getReportCountByParent(String parentID);
	public int getCount();
}