package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Student;
import com.dbms.model.Teacher;
import com.dbms.model.Parent;

public interface Parentdao{
	@Autowired
	public void saveOrUpdate(Parent parent);
	public void delete(String username);
	public List<Parent> getAll();
	public Parent getParent(String username);
	public int getCount();
}