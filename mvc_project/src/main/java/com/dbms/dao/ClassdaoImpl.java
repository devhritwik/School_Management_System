package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Class;
import com.dbms.model.Schedule;
import com.dbms.model.Teacher;
import com.dbms.model.User;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class ClassdaoImpl implements Classdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ClassdaoImpl() {
		
	}
	public ClassdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdateByAdmin(Class class1) {
		 String sql = "UPDATE class "
		 		+ "set className=?, roomNo=? where classID=?";
		 jdbcTemplate.update(sql,new Object[] {class1.getClassName(),class1.getRoomNo(),class1.getClassID()});
	}
	public void insertClass(Class class1) {
		String sql = "INSERT into class(classID,className,roomNo) select ?,?,? where not exists (select * from class where classID=?)";
			 jdbcTemplate.update(sql,new Object[] {class1.getClassID(),class1.getClassName(),class1.getRoomNo(),class1.getClassID()});
	}
	public void delete(String classID) {
		String sql;
		sql="update student set classID=null where classID=?";
		jdbcTemplate.update(sql,classID);
		sql="update subject set forClass=null where forClass=?";
		jdbcTemplate.update(sql,classID);
		sql = "DELETE FROM class WHERE classID=?";
		jdbcTemplate.update(sql,classID);
	}
	public List<Class> getAll(){
		 String sql = "SELECT * FROM class";
		 List<Class> classes= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Class.class));
		 
		 return classes;	  
	}	  
	public Class getClass(String classID) {
		String sql = "SELECT * FROM class WHERE classID='"+classID+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Class>() {
		
		public Class extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Class class1 = new Class();
				class1.setClassID(rs.getString("classID"));
				class1.setClassName(rs.getString("className"));
				class1.setRoomNo(rs.getString("roomNo"));
				
				return class1;
			}
			return null;
		}
	});
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM class";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
}