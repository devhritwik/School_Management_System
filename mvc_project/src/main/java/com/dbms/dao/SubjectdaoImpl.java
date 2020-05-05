package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.dbms.model.Class;
import com.dbms.model.Subject;
import com.dbms.model.Teacher;
import com.dbms.model.User;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class SubjectdaoImpl implements Subjectdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SubjectdaoImpl() {
		
	}
	public SubjectdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdateByAdmin(Subject subject) {
		 String sql = "UPDATE subject "
		 	+ "set subjectName=?,forClass=?,gradedOrNot=?,bookName=?,bookPublication=?,bookPrice=?,notebookType=? where subjectCode=?";
		 jdbcTemplate.update(sql,new Object[] {subject.getSubjectName(),subject.getForClass(),subject.getGradedOrNot(),
			subject.getBookName(),subject.getBookPublication(),subject.getBookPrice(),subject.getNotebookType(),subject.getSubjectCode()});
	}
	public void insertSubject(Subject subject) {
		String sql = "INSERT into subject(subjectCode,subjectName,forClass,gradedOrNot,bookName,bookPublication,bookPrice,notebookType) "
				+ "select ?,?,?,?,?,?,?,? where not exists (select * from subject where subjectCode=?)";
			 jdbcTemplate.update(sql,new Object[] {subject.getSubjectCode(),subject.getSubjectName(),subject.getForClass(),subject.getGradedOrNot(),
						subject.getBookName(),subject.getBookPublication(),subject.getBookPrice(),subject.getNotebookType(),subject.getSubjectCode()});
	}
	public void delete(String subjectCode) {
		String sql = "DELETE FROM subject WHERE subjectCode=?";
		jdbcTemplate.update(sql,subjectCode);
	}
	public List<Subject> getAll(){
		 String sql = "SELECT * FROM subject";
		 List<Subject> subjects= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Subject.class));
		 
		 return subjects;	  
	}	  
	public Subject getSubject(String subjectCode) {
		String sql = "SELECT * FROM subject WHERE subjectCode='"+subjectCode+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Subject>() {
		
		public Subject extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Subject subject = new Subject();
				subject.setSubjectCode(rs.getString("subjectCode"));
				subject.setSubjectName(rs.getString("subjectName"));
				subject.setForClass(rs.getString("forClass"));
				subject.setGradedOrNot(rs.getString("gradedOrNot"));
				subject.setBookName(rs.getString("bookName"));
				subject.setBookPublication(rs.getString("bookPublication"));
				subject.setBookPrice(rs.getDouble("bookPrice"));
				subject.setNotebookType(rs.getString("notebookType"));
				
				return subject;
			}
			return null;
		}
	});
	}
	
	public List<Subject> getSubjectsByClass(String classID){
		 String sql = "SELECT * FROM subject where forClass='"+classID+"'";
		 List<Subject> subjects= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Subject.class));
		 
		 return subjects;
	}
	
	public int getSubjectCountByClass(String classID) {
		String sql = "SELECT COUNT(*) FROM subject WHERE forClass='"+classID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public List<Subject> getSubjectsByTeacher(String teacherID){
		 String sql = "SELECT subject.subjectCode,subjectName,forClass,gradedOrNot,bookName,bookPublication,bookPrice,notebookType FROM subject,schedule where subject.subjectCode=schedule.subjectCode and teacherID='"+teacherID+"'";
		 List<Subject> subjects= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Subject.class));
		 
		 return subjects;
	}
	
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM subject";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	
}