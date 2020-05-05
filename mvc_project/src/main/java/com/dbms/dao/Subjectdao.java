package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Subject;

public interface Subjectdao{
	@Autowired
	public void saveOrUpdateByAdmin(Subject subject);
	public void insertSubject(Subject subject);
	public void delete(String subjectCode);
	public List<Subject> getAll();
	public Subject getSubject(String subjectCode);
	public List<Subject> getSubjectsByClass(String classID);
	public int getSubjectCountByClass(String classID);
	public List<Subject> getSubjectsByTeacher(String teacherID);
	public int getCount();
}