package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.dbms.model.Student;
import com.dbms.model.StudentHobbies;
import com.dbms.model.Teacher;
import com.dbms.model.TeacherLanguages;
import com.dbms.model.User;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class TeacherdaoImpl implements Teacherdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public TeacherdaoImpl() {
		
	}
	public TeacherdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Teacher teacher) {
		System.out.println(teacher.getTeacherID());
		 String sql = "UPDATE teacher "
		 		+ "set middleName=?,lastName=?,gender=?,DOB=?,mobNo=?,houseNo=?,street=?,locality=?,city=?,"
		 		+ "state=?,pinCode=?,aadharNo=?,maritalStatus=?,qualification=?"
		 		+ "where teacherID=?";
		 jdbcTemplate.update(sql,new Object[] {teacher.getMiddleName(),teacher.getLastName(),teacher.getGender(),
				 teacher.getDOB(),teacher.getMobNo(),teacher.getHouseNo(),teacher.getStreet(),teacher.getLocality(),
				 teacher.getCity(),teacher.getState(),teacher.getPincode(),teacher.getAadharNo(),
				 teacher.getMaritalStatus(),teacher.getQualification(),teacher.getTeacherID()});
	}
	public void saveOrUpdateByAdmin(Teacher teacher) {
		 String sql = "UPDATE teacher "
		 		+ "set firstName=?, email=?, salary=?,joinDate=?,resignDate=? where teacherID=?";
		 jdbcTemplate.update(sql,new Object[] {teacher.getFirstName(),teacher.getEmail(),
				 teacher.getSalary(),teacher.getJoinDate(),teacher.getResignDate(),teacher.getTeacherID()});
	}
	public void delete(String username) {
		
		String sql,p;
		int c;
		
		sql="delete from USERS_ROLES where user=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from USERS where username=?";
		jdbcTemplate.update(sql,username);
		
		sql="update homework set byTeacher=null where byTeacher=?";
		jdbcTemplate.update(sql,username);
		
		sql="update report set byTeacher=null where byTeacher=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from schedule where teacherID=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from teacherLanguages where teacherID=?";
		jdbcTemplate.update(sql,username);
		
		sql = "DELETE FROM teacher WHERE teacherID=?";
		jdbcTemplate.update(sql,username);
	}
	public List<Teacher> getAll(){
		 String sql = "SELECT * FROM teacher";
		 List<Teacher> teachers= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Teacher.class));
		 return teachers;	  
	}
	public Teacher getTeacher(String username) {
		String sql = "SELECT * FROM teacher WHERE teacherID='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Teacher>() {
		
		public Teacher extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherID(rs.getString("teacherID"));
				teacher.setFirstName(rs.getString("firstName"));
				teacher.setMiddleName(rs.getString("middleName"));
				teacher.setLastName(rs.getString("lastName"));
				teacher.setGender(rs.getString("gender"));
				teacher.setDOB(rs.getDate("DOB"));
				teacher.setMobNo(rs.getString("mobNo"));
				teacher.setEmail(rs.getString("email"));
				teacher.setHouseNo(rs.getString("houseNo"));
				teacher.setStreet(rs.getString("street"));
				teacher.setLocality(rs.getString("locality"));
				teacher.setCity(rs.getString("city"));
				teacher.setState(rs.getString("state"));
				teacher.setPincode(rs.getString("pincode"));
				teacher.setAadharNo(rs.getString("aadharNo"));
				teacher.setSalary(rs.getDouble("salary"));
				teacher.setMaritalStatus(rs.getString("maritalStatus"));
				teacher.setQualification(rs.getString("qualification"));
				teacher.setJoinDate(rs.getDate("joinDate"));
				teacher.setResignDate(rs.getDate("resignDate"));
				
				return teacher;
			}
			return null;
		}
		
	});
		
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM teacher";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public void insertLanguages(TeacherLanguages teacherLanguages, String username) {
		 String sql = "INSERT into teacherLanguages(teacherID,language) select ?,? where not exists (select * from teacherLanguages where teacherID=? and language=?)";
		 jdbcTemplate.update(sql,new Object[] {username,teacherLanguages.getLanguage(),username,teacherLanguages.getLanguage()});
	}
	public List<TeacherLanguages> getLanguagesbyTeacherID(String teacherID){
		 String sql = "SELECT * FROM teacherLanguages WHERE teacherID='"+teacherID+"'";
		 List<TeacherLanguages> languages= jdbcTemplate.query(sql, new BeanPropertyRowMapper(TeacherLanguages.class));
		 return languages;	  
	}
	
}