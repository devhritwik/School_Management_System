package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.dbms.model.Student;
import com.dbms.model.StudentHobbies;
import com.dbms.model.Accountant;
import com.dbms.model.Parent;
import com.dbms.model.User;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class AccountantdaoImpl implements Accountantdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public AccountantdaoImpl() {
		
	}
	public AccountantdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Accountant accountant) {
		System.out.println(accountant.getAccountantID());
		 String sql = "UPDATE accountant "
		 		+ "set middleName=?,lastName=?,gender=?,mobNo=?,aadharNo=? where accountantID=?";
		 jdbcTemplate.update(sql,new Object[] {accountant.getMiddleName(),accountant.getLastName(),accountant.getGender(),
				 accountant.getMobNo(),accountant.getAadharNo(),accountant.getAccountantID()});
	}
	public void saveOrUpdateByAdmin(Accountant accountant) {
		 String sql = "UPDATE accountant "
		 		+ "set firstName=?, email=?, workType=?, salary=?,joinDate=?,resignDate=? where accountantID=?";
		 jdbcTemplate.update(sql,new Object[] {accountant.getFirstName(),accountant.getEmail(),accountant.getWorkType(),
				 accountant.getSalary(),accountant.getJoinDate(),accountant.getResignDate(),accountant.getAccountantID()});
	}
	public void delete(String username) {
		
		String sql,p;
		int c;
		
		sql="delete from USERS_ROLES where user=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from USERS where username=?";
		jdbcTemplate.update(sql,username);
		
		sql="update bill set throughAccountant=null where throughAccountant=?";
		jdbcTemplate.update(sql,username);
		
		sql = "DELETE FROM accountant WHERE accountantID=?";
		jdbcTemplate.update(sql,username);
	}
	public List<Accountant> getAll(){
		 String sql = "SELECT * FROM accountant";
		 List<Accountant> accountants= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Accountant.class));
		 return accountants;	  
	}
	public Accountant getAccountant(String username) {
		String sql = "SELECT * FROM accountant WHERE accountantID='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Accountant>() {
		
		public Accountant extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Accountant accountant = new Accountant();
				accountant.setAccountantID(rs.getString("accountantID"));
				accountant.setFirstName(rs.getString("firstName"));
				accountant.setMiddleName(rs.getString("middleName"));
				accountant.setLastName(rs.getString("lastName"));
				accountant.setGender(rs.getString("gender"));
				accountant.setMobNo(rs.getString("mobNo"));
				accountant.setEmail(rs.getString("email"));
				accountant.setWorkType(rs.getString("workType"));
				accountant.setSalary(rs.getDouble("salary"));
				accountant.setAadharNo(rs.getString("aadharNo"));
				accountant.setJoinDate(rs.getDate("joinDate"));
				accountant.setResignDate(rs.getDate("resignDate"));
				
				return accountant;
			}
			return null;
		}
	});	
	}
	public int getCount(){
		String sql = "SELECT COUNT(*) FROM accountant";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
}