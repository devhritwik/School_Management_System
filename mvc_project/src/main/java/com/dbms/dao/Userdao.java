package com.dbms.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.User;

public interface Userdao{
	@Autowired
	public void saveOrUpdate(User user);
	public void delete(String username);
	public User getUser(String username);
	public void saveOrUpdateStudent(User user);
	public void saveOrUpdateTeacher(User user);
	public void saveOrUpdateParent(User user);
	public void saveOrUpdateAccountant(User user);
	
}