package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Report;
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

public class ReportdaoImpl implements Reportdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ReportdaoImpl() {
		
	}
	public ReportdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdateByAdmin(Report report) {
		 String sql = "UPDATE report "
		 	+ "set date=?,topic=?,message=?,action=?,forStudent=?,byTeacher=? where reportID=?";
		 jdbcTemplate.update(sql,new Object[] {report.getDate(),report.getTopic(),report.getMessage(),
			report.getAction(),report.getForStudent(),report.getByTeacher(),report.getReportID()});
	}
	public void insertReportByTeacher(Report report, String teacherID) {
		String sql = "INSERT into report(date,topic,message,action,forStudent,byTeacher) values(?,?,?,?,?,?)";
			 jdbcTemplate.update(sql,new Object[] {report.getDate(),report.getTopic(),report.getMessage(),
				report.getAction(),report.getForStudent(),teacherID});
	}
	public void delete(String reportID) {
		String sql = "DELETE FROM report WHERE reportID=?";
		jdbcTemplate.update(sql,reportID);
	}
	public List<Report> getAll(){
		 String sql = "SELECT * FROM report";
		 List<Report> reports= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Report.class));
		 return reports;	  
	}
	public Report getReport(String reportID) {
		String sql = "SELECT * FROM report WHERE reportID='"+reportID+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Report>() {
		
		public Report extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Report report = new Report();
				report.setReportID(rs.getInt("reportID"));
				report.setDate(rs.getDate("date"));
				report.setTopic(rs.getString("topic"));
				report.setMessage(rs.getString("message"));
				report.setAction(rs.getString("action"));
				report.setForStudent(rs.getString("forStudent"));
				report.setByTeacher(rs.getString("byTeacher"));
				
				return report;
			}
			return null;
		}
	});
	}

	public List<Report> getReportsByStudent(String studentID){
		 String sql = "SELECT * FROM report where forStudent='"+studentID+"'";
		 List<Report> reports= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Report.class));
		 
		 return reports;
	}
	
	public int getReportCountByStudent(String studentID) {
		String sql = "SELECT COUNT(*) FROM report WHERE forStudent='"+studentID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}

	public List<Report> getReportsByTeacher(String teacherID){
		 String sql = "SELECT * FROM report where byTeacher='"+teacherID+"'";
		 List<Report> reports= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Report.class));
		 
		 return reports;
	}
	
	public int getReportCountByTeacher(String teacherID) {
		String sql = "SELECT COUNT(*) FROM report WHERE byTeacher='"+teacherID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public List<Report> getReportsByParent(String parentID){
		 String sql = "SELECT reportID, report.date, topic, message, action, forStudent, byTeacher FROM "
		 		+ "report,student where student.parentID='"+parentID+"' and forStudent=student.studentID";
		 List<Report> reports= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Report.class));
		 
		 return reports;
	}
	
	public int getReportCountByParent(String parentID) {
		String sql = "SELECT COUNT(*) FROM report,student where student.parentID='"+parentID+"' and forStudent=student.studentID";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM report";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	
}