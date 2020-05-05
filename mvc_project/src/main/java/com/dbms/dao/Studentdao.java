package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Student;
import com.dbms.model.Teacher;
import com.dbms.model.StudentHobbies;
import com.dbms.model.StudentLanguages;


public interface Studentdao{
	@Autowired
	public void saveOrUpdate(Student student);
	public void saveOrUpdateByAdmin(Student student);
	public void delete(String username);
	public List<Student> getAll();
	public List<Student> getStudentsBySubject(String subjectCode);
	public Student getStudent(String username);
	public int getCount();
	public void insertHobbies(StudentHobbies studentHobbies, String username);
	public List<StudentHobbies> getHobbiesbyStudentID(String studentID);
	public void insertLanguages(StudentLanguages studentLanguages, String username);
	public List<StudentLanguages> getLanguagesbyStudentID(String studentID);
}