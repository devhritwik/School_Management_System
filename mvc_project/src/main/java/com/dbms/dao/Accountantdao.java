package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Accountant;

public interface Accountantdao{
	@Autowired
	public void saveOrUpdate(Accountant accountant);
	public void saveOrUpdateByAdmin(Accountant accountant);
	public void delete(String username);
	public List<Accountant> getAll();
	public Accountant getAccountant(String username);
	public int getCount();
	
}