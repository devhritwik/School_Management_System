package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Class;

public interface Classdao{
	@Autowired
	public void saveOrUpdateByAdmin(Class class1);
	public void insertClass(Class class1);
	public void delete(String classID);
	public List<Class> getAll();
	public Class getClass(String classID);
	public int getCount();
}