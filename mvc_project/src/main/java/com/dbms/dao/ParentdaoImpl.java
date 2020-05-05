package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.dbms.model.Parent;
import com.dbms.model.Parent;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class ParentdaoImpl implements Parentdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ParentdaoImpl() {
		
	}
	public ParentdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Parent parent) {
		 String sql = "UPDATE parent "
		 		+ "set fatherFirstName=?,fatherMiddleName=?,fatherLastName=?,motherFirstName=?,motherMiddleName=?,motherLastName=?,"
		 		+ "fatherMobNo=?,motherMobNo=?,fatherEmail=?,motherEmail=?,fatherProfession=?,motherProfession=?,"
		 		+ "fatherSalary=?,motherSalary=?,fatherAadharNo=?,motherAadharNo=?,fatherQualification=?,motherQualification=? where parentID=?";
		 jdbcTemplate.update(sql,new Object[] {parent.getFatherFirstName(),parent.getFatherMiddleName(),parent.getFatherLastName(),
				 parent.getMotherFirstName(),parent.getMotherMiddleName(),parent.getMotherLastName(),parent.getFatherMobNo(),parent.getMotherMobNo(),
				 parent.getFatherEmail(),parent.getMotherEmail(),parent.getFatherProfession(),parent.getMotherProfession(),
				 parent.getFatherSalary(),parent.getMotherSalary(),parent.getFatherAadharNo(),parent.getMotherAadharNo(),
				 parent.getFatherQualification(),parent.getMotherQualification(),parent.getParentID()});
	}
	public void delete(String username) {
		String sql = "DELETE FROM parent WHERE parentID=?";
		jdbcTemplate.update(sql,username);
	}
	public List<Parent> getAll(){
		 String sql = "SELECT * FROM parent";
		 List<Parent> parents= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Parent.class));
		 return parents;	  
	}
	public Parent getParent(String username) {
		String sql = "SELECT * FROM parent WHERE parentID='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Parent>() {
		
		public Parent extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Parent parent = new Parent();
				parent.setParentID(rs.getString("parentID"));
				parent.setFatherFirstName(rs.getString("fatherFirstName"));
				parent.setFatherMiddleName(rs.getString("fatherMiddleName"));
				parent.setFatherLastName(rs.getString("fatherLastName"));
				parent.setMotherFirstName(rs.getString("motherFirstName"));
				parent.setMotherMiddleName(rs.getString("motherMiddleName"));
				parent.setMotherLastName(rs.getString("motherLastName"));
				parent.setFatherMobNo(rs.getString("fatherMobNo"));
				parent.setMotherMobNo(rs.getString("motherMobNo"));
				parent.setFatherEmail(rs.getString("fatherEmail"));
				parent.setMotherEmail(rs.getString("motherEmail"));
				parent.setFatherProfession(rs.getString("fatherProfession"));
				parent.setMotherProfession(rs.getString("motherProfession"));
				parent.setFatherSalary(rs.getDouble("fatherSalary"));
				parent.setMotherSalary(rs.getDouble("motherSalary"));
				parent.setFatherAadharNo(rs.getString("fatherAadharNo"));
				parent.setMotherAadharNo(rs.getString("motherAadharNo"));
				parent.setFatherQualification(rs.getString("fatherQualification"));
				parent.setMotherQualification(rs.getString("motherQualification"));
				
				return parent;
			}
			return null;
		}
	});	
	}
	public int getCount(){
		String sql = "SELECT COUNT(*) FROM parent";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
}