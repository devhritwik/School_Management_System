package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Attendance;
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

public class AttendancedaoImpl implements Attendancedao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public AttendancedaoImpl() {
		
	}
	public AttendancedaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Attendance attendance) {
		 String sql = "UPDATE attendance "
		 	+ "set status=? where date=? and periodNo=? and studentID=?";
		 jdbcTemplate.update(sql,new Object[] {attendance.getStatus(),attendance.getDate(),attendance.getPeriodNo(),attendance.getStudentID()});
	}
	public void insertAttendance(Attendance attendance) {
		String sql = "INSERT into attendance(date,periodNo,studentID,status) values(?,?,?,?)";
			 jdbcTemplate.update(sql,new Object[] {attendance.getDate(),attendance.getPeriodNo(),attendance.getStudentID(),attendance.getStatus()});
	}
	public void delete(String date, String periodNo, String studentID) {
		String sql = "DELETE FROM attendance where date=? and periodNo=? and studentID=?";
		jdbcTemplate.update(sql,date,periodNo,studentID);
	}
	public void delete1(Date date, String periodNo, String studentID) {
		String sql = "DELETE FROM attendance where date=? and periodNo=? and studentID=?";
		jdbcTemplate.update(sql,date,periodNo,studentID);
	}
	public List<Attendance> getAll(){
		 String sql = "SELECT * FROM attendance";
		 List<Attendance> attendances= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Attendance.class));
		 return attendances;	  
	}
	public List<Attendance> getAttendanceByDate(Date date){
		 String sql = "SELECT * FROM attendance where date='"+date+"'";
		 List<Attendance> attendances= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Attendance.class));
		 return attendances;
	}
	public List<Attendance> getAttendanceByStudent(String studentID){
		 String sql = "SELECT * FROM attendance where studentID='"+studentID+"'";
		 List<Attendance> attendances= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Attendance.class));
		 return attendances;
	}
	public List<Attendance> getAttendanceByDatePeriod(Date date, String periodNo){
		 String sql = "SELECT * FROM attendance where date='"+date+"' and periodNo='"+periodNo+"'";
		 List<Attendance> attendances= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Attendance.class));
		 return attendances;
	}
	
}