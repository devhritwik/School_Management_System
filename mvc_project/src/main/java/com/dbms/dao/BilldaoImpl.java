package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Bill;
import com.dbms.model.Student;
import com.dbms.model.Teacher;
import com.dbms.model.User;
import com.dbms.model.Parent;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class BilldaoImpl implements Billdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public BilldaoImpl() {
		
	}
	public BilldaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Bill bill) {
		 String sql = "UPDATE bill "
		 	+ "set date=?,ofStudent=?,amount=?,concession=?,fine=?,feePeriod=?,status=? where billNo=?";
		 jdbcTemplate.update(sql,new Object[] {bill.getDate(),bill.getOfStudent(),bill.getAmount(),
			bill.getConcession(),bill.getFine(),bill.getFeePeriod(),bill.getStatus(),bill.getBillNo()});
	}
	public void insertBill(Bill bill, String accountantID) {
//		INSERT into studentLanguages(studentID,language) select ?,? where not exists (select * from studentLanguages where studentID=? and language=?)
		String sql = "INSERT into bill(date,ofStudent,amount,concession,fine,feePeriod,status,throughAccountant) select "
				+ "?,?,?,?,?,?,?,? where not exists (select * from bill where date=? and ofStudent=? and amount=? and concession=? and fine=? and feePeriod=? and status=?)";
			 jdbcTemplate.update(sql,new Object[] {bill.getDate(),bill.getOfStudent(),bill.getAmount(),
				bill.getConcession(),bill.getFine(),bill.getFeePeriod(),bill.getStatus(),accountantID,bill.getDate(),bill.getOfStudent(),bill.getAmount(),
				bill.getConcession(),bill.getFine(),bill.getFeePeriod(),bill.getStatus()});
	}
	public void delete(String billNo) {
		String sql = "DELETE FROM bill WHERE billNo=?";
		jdbcTemplate.update(sql,billNo);
	}
	public List<Bill> getAll(){
		 String sql = "SELECT * FROM bill";
		 List<Bill> bills= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Bill.class));
		 return bills;	  
	}
	public Bill getBill(String billNo) {
		String sql = "SELECT * FROM bill WHERE billNo='"+billNo+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Bill>() {
		
		public Bill extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Bill bill = new Bill();
				bill.setBillNo(rs.getInt("billNo"));
				bill.setDate(rs.getDate("date"));
				bill.setOfStudent(rs.getString("ofStudent"));
				bill.setAmount(rs.getDouble("amount"));
				bill.setConcession(rs.getDouble("concession"));
				bill.setFine(rs.getDouble("fine"));
				bill.setFeePeriod(rs.getString("feePeriod"));
				bill.setStatus(rs.getString("status"));
				return bill;
			}
			return null;
		}
	});
	}

	public List<Bill> getBillsByStudent(String studentID){
		 String sql = "SELECT * FROM bill where ofStudent='"+studentID+"'";
		 List<Bill> bills= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Bill.class));
		 return bills;
	}
	
	public int getBillCountByStudent(String studentID) {
		String sql = "SELECT COUNT(*) FROM bill WHERE ofStudent='"+studentID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}

	public List<Bill> getBillsByAccountant(String accountantID){
		 String sql = "SELECT * FROM bill where throughAccountant='"+accountantID+"'";
		 List<Bill> bills= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Bill.class));
		 return bills;
	}
	
	public int getBillCountByAccountant(String accountantID) {
		String sql = "SELECT COUNT(*) FROM bill WHERE throughAccountant='"+accountantID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public List<Bill> getBillsByParent(String parentID){
		 String sql = "SELECT billNo,date,ofStudent,amount,concession,fine,feePeriod,status,throughAccountant FROM "
		 		+ "bill,student where student.parentID='"+parentID+"' and ofStudent=student.studentID";
		 List<Bill> bills= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Bill.class));
		 return bills;
	}
	public List<Bill> getPaidBillsByParent(String parentID){
		 String sql = "SELECT billNo,date,ofStudent,amount,concession,fine,feePeriod,status,throughAccountant FROM "
		 		+ "bill,student where student.parentID='"+parentID+"' and ofStudent=student.studentID and status='Paid'";
		 List<Bill> bills= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Bill.class));
		 return bills;
	}
	public List<Bill> getUnpaidBillsByParent(String parentID){
		 String sql = "SELECT billNo,date,ofStudent,amount,concession,fine,feePeriod,status,throughAccountant FROM "
		 		+ "bill,student where student.parentID='"+parentID+"' and ofStudent=student.studentID and status='Not Paid'";
		 List<Bill> bills= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Bill.class));
		 return bills;
	}
	public int getBillCountByParent(String parentID) {
		String sql = "SELECT COUNT(*) FROM bill,student where student.parentID='"+parentID+"' and ofStudent=student.studentID";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM bill";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	
}