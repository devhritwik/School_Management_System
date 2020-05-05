package com.dbms.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Parent;
import com.dbms.model.Bill;

public interface Billdao{
	@Autowired
	public void saveOrUpdate(Bill bill);
	public void insertBill(Bill bill, String accountantID);
	public void delete(String billNo);
	public List<Bill> getAll();
	public Bill getBill(String billNo);
	public List<Bill> getBillsByStudent(String studentID);
	public int getBillCountByStudent(String studentID);
	public List<Bill> getBillsByAccountant(String accountantID);
	public int getBillCountByAccountant(String accountantID);
	public List<Bill> getBillsByParent(String parentID);
	public int getBillCountByParent(String parentID);
	public int getCount();
}