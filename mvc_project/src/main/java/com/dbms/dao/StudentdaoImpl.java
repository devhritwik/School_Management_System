package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Student;
import com.dbms.model.Subject;
import com.dbms.model.Teacher;
import com.dbms.model.User;
import com.dbms.model.StudentHobbies;
import com.dbms.model.StudentLanguages;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class StudentdaoImpl implements Studentdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public StudentdaoImpl() {
		
	}
	public StudentdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Student student) {
		System.out.println(student.getStudentID());
		 String sql = "UPDATE student "
		 		+ "set middleName=?,lastName=?,gender=?,DOB=?,mobNo=?,houseNo=?,street=?,locality=?,city=?,"
		 		+ "state=?,pincode=?,bloodGp=?,aadharNo=?,category=? where studentID=?";
		 jdbcTemplate.update(sql,new Object[] {student.getMiddleName(),student.getLastName(),student.getGender(),
				 student.getDOB(),student.getMobNo(),student.getHouseNo(),student.getStreet(),student.getLocality(),
				 student.getCity(),student.getState(),student.getPincode(),
				 student.getBloodGp(),student.getAadharNo(),student.getCategory(),student.getStudentID()});
	}
	public void saveOrUpdateByAdmin(Student student) {
		System.out.println(student.getStudentID());
		 String sql = "UPDATE student "
		 		+ "set firstName=?, email=?, parentID=?,classID=?,admissionYear=? where studentID=?";
		 jdbcTemplate.update(sql,new Object[] {student.getFirstName(),student.getEmail(),student.getParentID(),student.getClassID(),student.getAdmissionYear(),student.getStudentID()});
	}
	public void delete(String username) {
		String sql,p;
		int c;
		
		sql="delete from USERS_ROLES where user=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from USERS where username=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from attendance where studentID=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from bill where ofStudent=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from homeworkOfStudent where studentID=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from marksInExam where studentID=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from studentHobbies where studentID=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from studentLanguages where studentID=?";
		jdbcTemplate.update(sql,username);
		
		sql="delete from report where forStudent=?";
		jdbcTemplate.update(sql,username);
		
		sql = "select parentID from student where studentID='"+username+"'";
		p = jdbcTemplate.queryForObject(sql,String.class);
		
		sql = "DELETE FROM student WHERE studentID=?";
		jdbcTemplate.update(sql,username);
		
		sql = "select count(*) FROM student where parentID='"+p+"'";
		c = jdbcTemplate.queryForObject(sql,Integer.class);
		if(c==0) {
			sql = "DELETE FROM parent WHERE parentID=?";
			jdbcTemplate.update(sql,p);
		}
		
	}
	public List<Student> getAll(){
		 String sql = "SELECT * FROM student";
		 List<Student> students= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Student.class));
		 
		 return students;	  
	}
//	public List<Student> getAll() {
//
//		String sql = "SELECT * FROM student";
//		List<Student> students;
//			
//		return jdbcTemplate.query(sql,new ResultSetExtractor<Student>() {
//			
//			public Student extractData(ResultSet rs) throws SQLException,DataAccessException{
//				if(rs.next()) {
//					Student student = new Student();
//					student.setStudentID(rs.getString("studentID"));
//					student.setFirstName(rs.getString("firstName"));
//					student.setMiddleName(rs.getString("middleName"));
//					student.setLastName(rs.getString("lastName"));
//					student.setGender(rs.getString("gender"));
//					student.setDOB(rs.getDate("DOB"));
//					student.setMobNo(rs.getString("mobNo"));
//					student.setEmail(rs.getString("email"));
//					student.setHouseNo(rs.getString("houseNo"));
//					student.setStreet(rs.getString("street"));
//					student.setLocality(rs.getString("locality"));
//					student.setCity(rs.getString("city"));
//					student.setState(rs.getString("state"));
//					student.setPincode(rs.getString("pincode"));
//					student.setParentID(rs.getString("parentID"));
//					student.setClassID(rs.getString("classID"));
//					student.setBloodGp(rs.getString("bloodGp"));
//					student.setAdmissionYear(rs.getInt("admissionYear"));
//					student.setAadharNo(rs.getString("aadharNo"));
//					student.setCategory(rs.getString("category"));
//					
//					students.add(student);
//				}
//			}
//			
//		});
//	  }
	  
	public Student getStudent(String username) {
		String sql = "SELECT * FROM student WHERE studentID='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Student>() {
		
		public Student extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Student student = new Student();
				student.setStudentID(rs.getString("studentID"));
				student.setFirstName(rs.getString("firstName"));
				student.setMiddleName(rs.getString("middleName"));
				student.setLastName(rs.getString("lastName"));
				student.setGender(rs.getString("gender"));
				student.setDOB(rs.getDate("DOB"));
				student.setMobNo(rs.getString("mobNo"));
				student.setEmail(rs.getString("email"));
				student.setHouseNo(rs.getString("houseNo"));
				student.setStreet(rs.getString("street"));
				student.setLocality(rs.getString("locality"));
				student.setCity(rs.getString("city"));
				student.setState(rs.getString("state"));
				student.setPincode(rs.getString("pincode"));
				student.setParentID(rs.getString("parentID"));
				student.setClassID(rs.getString("classID"));
				student.setBloodGp(rs.getString("bloodGp"));
				student.setAdmissionYear(rs.getInt("admissionYear"));
				student.setAadharNo(rs.getString("aadharNo"));
				student.setCategory(rs.getString("category"));
				
				return student;
			}
			return null;
		}
		
	});
		
	}
	
	public List<Student> getStudentsBySubject(String subjectCode) {
		String sql = "SELECT student.studentID,student.firstName,student.middleName,student.lastName,student.gender,student.dOB," + 
				"student.mobNo,student.email,student.houseNo,student.street,student.locality,student.city,student.state," + 
				"student.pincode,student.parentID,student.classID,student.bloodGp,student.admissionYear,student.aadharNo," + 
				"student.category from student,class,subject where subject.subjectCode='"+subjectCode+
				"' and student.classID=class.classID and subject.forClass=class.classID";
		List<Student> students= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Student.class));
		 return students;
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM student";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
//	public void insertHobbies(StudentHobbies studentHobbies, String username) {
//		 String sql = "INSERT into studentHobbies(studentID,hobby) values('"+username+"',?)";
//		 jdbcTemplate.update(sql,new Object[] {studentHobbies.getHobby()});
//	}
	public void insertHobbies(StudentHobbies studentHobbies, String username) {
	     String sql = "INSERT into studentHobbies(studentID,hobby) select ?,? where not exists (select * from studentHobbies where studentID=? and hobby=?)";
	     jdbcTemplate.update(sql,new Object[] {username,studentHobbies.getHobby(),username,studentHobbies.getHobby()});
	  }
	public List<StudentHobbies> getHobbiesbyStudentID(String studentID){
		 String sql = "SELECT * FROM studentHobbies WHERE studentID='"+studentID+"'";
		 List<StudentHobbies> hobbies= jdbcTemplate.query(sql, new BeanPropertyRowMapper(StudentHobbies.class));
		 return hobbies;	  
	}
	
//	public void insertLanguages(StudentLanguages studentLanguages, String username) {
//		 String sql = "INSERT into studentLanguages(studentID,language) values('"+username+"',?)";
//		 jdbcTemplate.update(sql,new Object[] {studentLanguages.getLanguage()});
//	}
	public void insertLanguages(StudentLanguages studentLanguages, String username) {
	     String sql = "INSERT into studentLanguages(studentID,language) select ?,? where not exists (select * from studentLanguages where studentID=? and language=?)";
	     jdbcTemplate.update(sql,new Object[] {username,studentLanguages.getLanguage(),username,studentLanguages.getLanguage()});
	}
	public List<StudentLanguages> getLanguagesbyStudentID(String studentID){
		 String sql = "SELECT * FROM studentLanguages WHERE studentID='"+studentID+"'";
		 List<StudentLanguages> languages= jdbcTemplate.query(sql, new BeanPropertyRowMapper(StudentLanguages.class));
		 return languages;	  
	}
	
	
}