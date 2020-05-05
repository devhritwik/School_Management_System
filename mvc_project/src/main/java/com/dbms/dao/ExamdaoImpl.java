package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Exam;
import com.dbms.model.MarksInExam;
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

public class ExamdaoImpl implements Examdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ExamdaoImpl() {
		
	}
	public ExamdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Exam exam) {
		 String sql = "UPDATE exam "
		 	+ "set time=?,roomNo=?,maxMarks=? where date=? and type=? and subjectCode=?";
		 jdbcTemplate.update(sql,new Object[] {exam.getTime(),exam.getRoomNo(),exam.getMaxMarks(),
			exam.getDate(),exam.getType(),exam.getSubjectCode()});
	}
	public void insertExam(Exam exam) {
		String sql = "INSERT into exam values(?,?,?,?,?,?)";
			 jdbcTemplate.update(sql,new Object[] {exam.getDate(),exam.getType(),exam.getSubjectCode(),
					 exam.getTime(),exam.getRoomNo(),exam.getMaxMarks()});
	}
	public void insertMarksInExam(MarksInExam marksInExam) {
		String sql = "INSERT into marksInExam values(?,?,?,?,?)";
		 jdbcTemplate.update(sql,new Object[] {marksInExam.getDate(),marksInExam.getType(),marksInExam.getSubjectCode(),
				 marksInExam.getStudentID(),marksInExam.getMarksObtained()});
	}
	public void deleteMarksInExam(String date, String type, String subjectCode) {
		String sql = "DELETE FROM marksInExam WHERE date=? and type=? and subjectCode=?";
		 jdbcTemplate.update(sql,new Object[] {date,type,subjectCode});
	}
	public void delete(Date date, String type, String subjectCode) {
		String sql = "DELETE FROM exam WHERE date=? and type=? and subjectCode=?";
		jdbcTemplate.update(sql,date,type,subjectCode);
	}
	public List<Exam> getAll(){
		 String sql = "SELECT * FROM exam";
		 List<Exam> exams= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Exam.class));
		 return exams;	  
	}
	public Exam getExam(String date, String type, String subjectCode) {
		String sql = "SELECT * FROM exam WHERE date='"+date+"' and type='"+type+"' and subjectCode='"+subjectCode+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Exam>() {
		
		public Exam extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Exam exam = new Exam();
				exam.setDate(rs.getDate("date"));
				exam.setType(rs.getString("type"));
				exam.setSubjectCode(rs.getString("subjectCode"));
				exam.setTime(rs.getTime("time"));
				exam.setRoomNo(rs.getString("roomNo"));
				exam.setMaxMarks(rs.getDouble("maxMarks"));
				
				return exam;
			}
			return null;
		}
	});
	}

	public List<Exam> getExamsByStudent(String studentID){
		 String sql = "SELECT exam.date,type,exam.subjectCode,time,exam.roomNo,maxMarks FROM "
		 		+ "exam,student,class,subject where student.studentID='"+studentID+
		 	"' and student.classID=class.classID and subject.forClass=class.classID and exam.subjectCode=subject.subjectCode";
		 List<Exam> exams= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Exam.class));
		 
		 return exams;
	}
	
	public int getExamCountByStudent(String studentID) {
		String sql = "SELECT COUNT(*) FROM exam,student,class,subject where student.studentID='"+studentID+
			"' and student.classID=class.classID and subject.forClass=class.classID and exam.subjectCode=subject.subjectCode";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	public List<MarksInExam> getMarksInExams(String studentID){
		 String sql = "SELECT * FROM marksInExam where studentID='"+studentID+"'";
		 List<MarksInExam> exams= jdbcTemplate.query(sql, new BeanPropertyRowMapper(MarksInExam.class));
		 return exams;
	}
	public List<MarksInExam> getAllMarksByExam(String date, String type, String subjectCode){
		System.out.println(date);
        System.out.println(type);
        System.out.println(subjectCode);
		 String sql = "SELECT * FROM marksInExam where date='"+date+"' and type='"+type+"' and subjectCode='"+subjectCode+"'";
		 List<MarksInExam> exams= jdbcTemplate.query(sql, new BeanPropertyRowMapper(MarksInExam.class));
		 return exams;
	}
	public List<Exam> getExamsByTeacher(String teacherID){
		 String sql = "SELECT DISTINCT exam.date,type,exam.subjectCode,time,exam.roomNo,maxMarks FROM exam,schedule where "
		 		+ "schedule.teacherID='"+teacherID+"' and schedule.subjectCode=exam.subjectCode";
		 List<Exam> exams= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Exam.class));
		 
		 return exams;
	}
	
	public int getExamCountByTeacher(String teacherID) {
		String sql = "SELECT DISTINCT COUNT(*) FROM exam,schedule WHERE schedule.teacherID=='"+teacherID+
				"' and schedule.subjectCode=exam.subjectCode";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM exam";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
}