package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import com.dbms.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class UserdaoImpl implements Userdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserdaoImpl() {
		
	}
	public UserdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(User user) {
		 String sql = "INSERT INTO USERS(username, password) VALUES (?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getPassword()});
		 sql = "INSERT INTO USERS_ROLES(user,role) VALUES(?,?)";
		 // System.out.println(user.getUsername() );
		 if((user.getType()).equals("student"))
		 {
			 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_STUDENT"});
			 saveOrUpdateStudent(user);
		 }
		 else if((user.getType()).equals("teacher"))
		 {
			 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_TEACHER"});
			 saveOrUpdateTeacher(user);
		 }
		 else if((user.getType()).equals("parent"))
		 {
			 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_PARENT"});
			 saveOrUpdateParent(user);
		 }
		 else if((user.getType()).equals("accountant"))
		 {
			 jdbcTemplate.update(sql,new Object[] {user.getUsername(),"ROLE_ACCOUNTANT"});
			 saveOrUpdateAccountant(user);
		 }
	}
	public void delete(String username) {
		String sql = "DELETE FROM USERS WHERE username=?";
		jdbcTemplate.update(sql,username);
	}
	public User getUser(String username) {
		String sql = "SELECT * FROM USERS, USERS_ROLES WHERE USERS.username=USERS_ROLES.user and username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				String role_type=rs.getString("role");
				if(role_type.equals("ROLE_TEACHER"))user.setType("teacher");
				else if(role_type.equals("ROLE_STUDENT"))user.setType("student");
				else if(role_type.equals("ROLE_PARENT"))user.setType("parent");
				else if(role_type.equals("ROLE_ACCOUNTANT"))user.setType("accountant");
				else if(role_type.equals("ROLE_ADMIN"))user.setType("admin");
				
				return user;
			}
			return null;
		}
		
	});
		
	}
	public void saveOrUpdateTeacher(User user) {
		String sql="INSERT INTO teacher(teacherID,firstName,email) VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getName(),user.getMail()});
		
	}
	public void saveOrUpdateParent(User user) {
		String sql="INSERT INTO parent(parentID) VALUES(?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername()});
		
	}
	public void saveOrUpdateStudent(User user) {
		String sql="INSERT INTO student(studentID,firstName,email) VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getName(),user.getMail()});
		
	}
	public void saveOrUpdateAccountant(User user) {
		String sql="INSERT INTO accountant(accountantID,firstName,email) VALUES(?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getName(),user.getMail()});
		
	}
	
}