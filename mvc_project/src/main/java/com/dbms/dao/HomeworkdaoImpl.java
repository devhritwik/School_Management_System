package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Student;
import com.dbms.model.Teacher;
import com.dbms.model.User;
import com.dbms.model.Parent;
import com.dbms.model.Homework;
import com.dbms.model.HomeworkOfStudent;
import com.dbms.model.HomeworkWithStatus;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

public class HomeworkdaoImpl implements Homeworkdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public HomeworkdaoImpl() {
		
	}
	public HomeworkdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(Homework homework) {
		 String sql = "UPDATE homework set date=?,maxMarks=?,byTeacher=?,subjectCode=? where homeworkID=?";
		 jdbcTemplate.update(sql,new Object[] {homework.getDate(),homework.getMaxMarks(),homework.getByTeacher(),homework.getHomeworkID(),homework.getSubjectCode()});
	}
	// INSERT into studentLanguages(studentID,language) select ?,? where not exists (select * from studentLanguages where studentID=? and language=?)
	public void insertHomeworkByTeacher(Homework homework, String teacherID) {
		String sql = "INSERT into homework(date,maxMarks,byTeacher,subjectCode) values(?,?,?,?)";
			 jdbcTemplate.update(sql,new Object[] {homework.getDate(),homework.getMaxMarks(),teacherID,homework.getSubjectCode()});
	}
	public void insertHomeworkOfStudent(Homework homework, String studentID) {
		String sql = "INSERT into homeworkOfStudent(homeworkID,studentID) select ?,? where not exists "
				+ "(select * from homeworkOfStudent where homeworkID=? and studentID=?)";
		 jdbcTemplate.update(sql,new Object[] {homework.getHomeworkID(),studentID,homework.getHomeworkID(),studentID});
	}
	public void insertHomeworkOfStudentStatus(HomeworkOfStudent homework) {
		String sql = "INSERT into homeworkOfStudent(homeworkID,studentID,status) values(?,?,?)";
		 jdbcTemplate.update(sql,new Object[] {homework.getHomeworkID(),homework.getStudentID(),homework.getStatus()});
	}
	public void deleteHomeworkOfStudent(String homeworkID, String studentID) {
		String sql = "DELETE FROM homeworkOfStudent WHERE homeworkID=? and studentID=?";
		jdbcTemplate.update(sql,homeworkID,studentID);
	}
	public void delete(String homeworkID) {
		String sql = "DELETE FROM homework WHERE homeworkID=?";
		jdbcTemplate.update(sql,homeworkID);
	}
	public List<Homework> getAll(){
		 String sql = "SELECT * FROM homework";
		 List<Homework> homeworks= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Homework.class));
		 return homeworks;	  
	}
	public Homework getHomework(String homeworkID) {
		String sql = "SELECT * FROM homework WHERE homeworkId='"+homeworkID+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Homework>() {
		
		public Homework extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Homework homework = new Homework();
				homework.setHomeworkID(rs.getInt("homeworkID"));
				homework.setDate(rs.getDate("date"));
				homework.setMaxMarks(rs.getInt("maxMarks"));
				homework.setByTeacher(rs.getString("byTeacher"));
				homework.setSubjectCode(rs.getString("subjectCode"));
				return homework;
			}
			return null;
		}
	});
	}
	//Todo
//	public List < Pair <Homework, String> > getHomeworksByStudent(String studentID){
//		
//		 String sql = "SELECT homework.homeworkID,date,maxMarks,byTeacher,status FROM homework,homeworkOfStudent where studentID='"+studentID+
//		 "' and homework.homeworkID=homeworkOfStudent.homeworkID";
//		 return jdbcTemplate.query(sql,new ResultSetExtractor< List <Pair <Homework, String> > >() {
//			 @Override
//			 public List < Pair <Homework, String> > extractData(ResultSet rs) throws SQLException, DataAccessException {
//				 List < Pair <Homework, String> > homeworks = new ArrayList <Pair <Homework, String> > (); 
//				 if(!rs.isBeforeFirst())return null;
//				 while(rs.next())
//				 {
//					 Homework homework= new Homework();
//					 String s = new String();
//					 homework.setHomeworkID(rs.getInt("homeworkID"));
//					 homework.setDate(rs.getDate("date"));
//					 homework.setMaxMarks(rs.getInt("maxMarks"));
//					 homework.setByTeacher(rs.getString("byTeacher"));
//					 
//				 }
//			 }
//			 
//		 }
//	}
	
	public List<Homework> getHomeworksByStudent(String studentID){
		 String sql = "SELECT homework.homeworkID,date,maxMarks,byTeacher,subjectCode FROM homework,homeworkOfStudent where studentID='"+studentID+
		 "' and homework.homeworkID=homeworkOfStudent.homeworkID";
	List<Homework> homeworks=jdbcTemplate.query(sql, new BeanPropertyRowMapper(Homework.class));
	return homeworks;
	}
	public List<HomeworkWithStatus> getHomeworksByStudentStatus(String studentID){
		 String sql = "SELECT homework.homeworkID,date,maxMarks,byTeacher,subjectCode,homeworkOfStudent.status FROM homework,homeworkOfStudent where studentID='"+studentID+
		 "' and homework.homeworkID=homeworkOfStudent.homeworkID";
	List<HomeworkWithStatus> homeworks=jdbcTemplate.query(sql, new BeanPropertyRowMapper(HomeworkWithStatus.class));
	return homeworks;
	}
	
	
	public int getHomeworkCountByStudent(String studentID) {
		String sql = "SELECT COUNT(*) FROM homework,homeworkOfStudent WHERE studentID='"+studentID+
				"' and homework.homeworkID=homeworkOfStudent.homeworkID";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}

	public List<Homework> getHomeworksByTeacher(String teacherID){
		 String sql = "SELECT homeworkID,date,maxMarks,byTeacher,subjectCode FROM homework where byTeacher='"+teacherID+"'";
		 List<Homework> homeworks= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Homework.class));
		 
		 return homeworks;
	}
	
	public int getHomeworkCountByTeacher(String teacherID) {
		String sql = "SELECT COUNT(*) FROM homework WHERE byTeacher='"+teacherID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public List<HomeworkOfStudent> getStudentsByTeacherHomework(String teacherID, String homeworkID){
		 String sql = "SELECT homeworkOfStudent.homeworkID,homeworkOfStudent.studentID,homeworkOfStudent.status "
		 		+ "FROM homework,homeworkOfStudent where "
		 		+ "homework.homeworkID=homeworkOfStudent.homeworkID and byTeacher='"+teacherID+"' and homeworkOfStudent.homeworkID='"+homeworkID+"'";
		 List<HomeworkOfStudent> students= jdbcTemplate.query(sql, new BeanPropertyRowMapper(HomeworkOfStudent.class));
		 return students;
	}
	
	public int getStudentCountByTeacherHomework(String teacherID) {
		String sql = "SELECT COUNT(homeworkOfStudent.studentID) FROM homework,homeworkOfStudent where homework.homeworkID="
		 		+ "homeworkOfStudent.homeworkID and byTeacher='"+teacherID+"'";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
	public int getCount(){
		
		String sql = "SELECT COUNT(*) FROM homework";
		int c = jdbcTemplate.queryForObject(sql,Integer.class);	
		return c;
	}
	
}