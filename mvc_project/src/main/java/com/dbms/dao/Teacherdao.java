package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Student;
import com.dbms.model.StudentLanguages;
import com.dbms.model.Teacher;
import com.dbms.model.TeacherLanguages;

public interface Teacherdao{
	@Autowired
	public void saveOrUpdate(Teacher teacher);
	public void saveOrUpdateByAdmin(Teacher teacher);
	public void delete(String username);
	public List<Teacher> getAll();
	public Teacher getTeacher(String username);
	public int getCount();
	public void insertLanguages(TeacherLanguages teacherLanguages, String username);
	public List<TeacherLanguages> getLanguagesbyTeacherID(String teacherID);
}