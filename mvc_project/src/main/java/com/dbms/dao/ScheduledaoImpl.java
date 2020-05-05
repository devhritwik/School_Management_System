package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import com.dbms.model.Schedule;
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

public class ScheduledaoImpl implements Scheduledao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ScheduledaoImpl() {
		
	}
	public ScheduledaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void editSchedule(Schedule schedule) {
		 String sql = "UPDATE schedule "
		 	+ "set day=? and periodNo=? and classID=? and teacherID=? and subjectCode=? where";
		 jdbcTemplate.update(sql,new Object[] {schedule.getDay(),schedule.getPeriodNo(),schedule.getClassID(),schedule.getTeacherID(),schedule.getSubjectCode()});
	}
	public void insertSchedule(Schedule schedule) {
		String sql = "INSERT into schedule(day,periodNo,classID,teacherID,subjectCode) values(?,?,?,?,?)";
			 jdbcTemplate.update(sql,new Object[] {schedule.getDay(),schedule.getPeriodNo(),schedule.getClassID(),schedule.getTeacherID(),schedule.getSubjectCode()});
	}
	public void delete(String day, Integer periodNo, String classID, String teacherID, String subjectCode) {
		String sql = "DELETE FROM schedule where day=? and periodNo=? and classID=? and teacherID=? and subjectCode=?";
		jdbcTemplate.update(sql,day,periodNo,classID,teacherID,subjectCode);
	}
	public List<Schedule> getAll(){
		 String sql = "SELECT * FROM schedule order by case when day='monday' then 1 when day='tuesday' then 2 "
		 		+ "when day='wednesday' then 3 when day='thursday' then 4 when day='friday' then 5 when day='saturday' then 6 when day='sunday' then 7 end";
		 List<Schedule> schedules= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Schedule.class));
		 return schedules;	  
	}
	public Schedule getSchedule(String day, Integer periodNo, String classID, String teacherID, String subjectCode){
		String sql = "SELECT * FROM schedule WHERE day='"+day+"' and periodNo="+periodNo+" and classID='"+classID+
				"' and teacherID='"+teacherID+"' and subjectCode='"+subjectCode+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<Schedule>() {
		
			public Schedule extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Schedule schedule = new Schedule();
					schedule.setDay(rs.getString("day"));
					schedule.setPeriodNo(rs.getInt("periodNo"));
					schedule.setClassID(rs.getString("classID"));
					schedule.setTeacherID(rs.getString("teacherID"));
					schedule.setSubjectCode(rs.getString("subjectCode"));
					return schedule;
				}
				return null;
			}
		});
	}
	public List<Schedule> getScheduleByDay(String day){
		 String sql = "SELECT * FROM schedule where day='"+day+"' order by periodNo";
		 List<Schedule> schedules= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Schedule.class));
		 return schedules;
	}
	public List<Schedule> getScheduleByStudent(String studentID){
		 String sql = "SELECT day,periodNo,schedule.classID,teacherID,subjectCode FROM schedule,student where student.studentID='"
				 +studentID+"' and student.classID=schedule.classID order by case when day='monday' then 1 "
				 + "when day='tuesday' then 2 when day='wednesday' then 3 when day='thursday' then 4 when "
				 + "day='friday' then 5 when day='saturday' then 6 when day='sunday' then 7 end" ;
		 List<Schedule> schedules= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Schedule.class));
		 return schedules;
	}
	public List<Schedule> getScheduleByTeacher(String teacherID){
		 String sql = "SELECT * FROM schedule where teacherID='"+teacherID+"' order by case when day='monday' "
		 		+ "then 1 when day='tuesday' then 2 when day='wednesday' then 3 when day='thursday' then 4 "
		 		+ "when day='friday' then 5 when day='saturday' then 6 when day='sunday' then 7 end";
		 List<Schedule> schedules= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Schedule.class));
		 return schedules;
	}
	public List<Schedule> getScheduleByClass(String classID){
		 String sql = "SELECT * FROM schedule where classID='"+classID+"' order by case when day='monday' "
		 		+ "then 1 when day='tuesday' then 2 when day='wednesday' then 3 when day='thursday' then 4 "
		 		+ "when day='friday' then 5 when day='saturday' then 6 when day='sunday' then 7 end";
		 List<Schedule> schedules= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Schedule.class));
		 return schedules;
	}
	public List<Schedule> getScheduleBySubject(String subjectCode){
		 String sql = "SELECT * FROM schedule where subjectCode='"+subjectCode+"' order by case when day='monday' "
		 		+ "then 1 when day='tuesday' then 2 when day='wednesday' then 3 when day='thursday' then 4 when "
		 		+ "day='friday' then 5 when day='saturday' then 6 when day='sunday' then 7 end";
		 List<Schedule> schedules= jdbcTemplate.query(sql, new BeanPropertyRowMapper(Schedule.class));
		 return schedules;
	}
	
}
