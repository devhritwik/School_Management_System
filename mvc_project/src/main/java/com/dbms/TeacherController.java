package com.dbms;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


import com.dbms.dao.Studentdao;
import com.dbms.dao.Teacherdao;
import com.dbms.dao.Userdao;
import com.dbms.dao.Parentdao;
import com.dbms.dao.Accountantdao;
import com.dbms.dao.Classdao;
import com.dbms.dao.Subjectdao;
import com.dbms.dao.Reportdao;
import com.dbms.dao.Homeworkdao;
import com.dbms.dao.Billdao;
import com.dbms.dao.Attendancedao;
import com.dbms.dao.Scheduledao;
import com.dbms.dao.Examdao;

import com.dbms.model.Student;
import com.dbms.model.StudentHobbies;
import com.dbms.model.Teacher;
import com.dbms.model.TeacherLanguages;
import com.dbms.model.Parent;
import com.dbms.model.Accountant;
import com.dbms.model.User;
import com.dbms.model.Class;
import com.dbms.model.Subject;
import com.dbms.model.Report;
import com.dbms.model.Homework;
import com.dbms.model.HomeworkOfStudent;
import com.dbms.model.Bill;
import com.dbms.model.Attendance;
import com.dbms.model.AttendanceList;
import com.dbms.model.Schedule;
import com.dbms.model.StatusList;
import com.dbms.model.Exam;
import com.dbms.model.MarksInExam;
import com.dbms.model.MarksList;



@Controller
public class TeacherController {

	@Autowired
	public Userdao userdao;
	@Autowired
	public Studentdao studentdao;
	@Autowired
	public Teacherdao teacherdao;
	@Autowired
	public Parentdao parentdao;
	@Autowired
	public Accountantdao accountantdao;
	@Autowired
	public Classdao classdao;
	@Autowired
	public Subjectdao subjectdao;
	@Autowired
	public Reportdao reportdao;
	@Autowired
	public Homeworkdao homeworkdao;
	@Autowired
	public Billdao billdao;
	@Autowired
	public Attendancedao attendancedao;
	@Autowired
	public Scheduledao scheduledao;
	@Autowired
	public Examdao examdao;
	
	
	@RequestMapping(value = "/teacher/dashboard")
	public String welcome(Model model, Principal principal) {
		
		/*if(principal != null)
		{*/
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			model.addAttribute("teacher",teacher);
			model.addAttribute("topic","DASHBOARD");
			//System.out.println(principal.getName());
			List<TeacherLanguages> languages= teacherdao.getLanguagesbyTeacherID(principal.getName());
			model.addAttribute("languages",languages);
			return "teacherDashboard";
		
		//return null;
	}
	
	@RequestMapping(value="/profile/t/{id}",method = RequestMethod.GET)  
	public String teacherProfile(Model model, @PathVariable String id) {
		Teacher teacher=teacherdao.getTeacher(id);
		model.addAttribute("teacher",teacher);
		model.addAttribute("topic",id+"'s Profile");
		List<TeacherLanguages> languages= teacherdao.getLanguagesbyTeacherID(id);
		model.addAttribute("languages",languages);
		return "teacherDashboardByAdmin";
	}

	@RequestMapping(value="/teacher/editProfile",method=RequestMethod.GET)
	public String editProfile(Model model, Principal principal) {

		Teacher teacher=teacherdao.getTeacher(principal.getName());
//		System.out.println(teacher.getTeacherID());
		model.addAttribute("teacher",teacher);
		Map< String, String > types = new HashMap<String, String>();
        types.put("Married", "Married");
        types.put("Unmarried", "Unmarried");
        model.addAttribute("typesList", types);
        Map< String, String > genderTypes = new HashMap<String, String>();
		genderTypes.put("Male", "Male");
		genderTypes.put("Female", "Female");
		genderTypes.put("Other", "Other");
        model.addAttribute("genderTypes", genderTypes);
		return "editTeacherProfile";
	}
	
	@RequestMapping(value="/teacher/editProfile",method=RequestMethod.POST)
	public String editProfileProcess(@Valid @ModelAttribute("teacher") Teacher teacher,BindingResult result,Model model) {
		if(result.hasErrors()) {
			Map< String, String > types = new HashMap<String, String>();
	        types.put("Married", "Married");
	        types.put("Unmarried", "Unmarried");
	        model.addAttribute("typesList", types);
	        Map< String, String > genderTypes = new HashMap<String, String>();
			genderTypes.put("Male", "Male");
			genderTypes.put("Female", "Female");
			genderTypes.put("Other", "Other");
	        model.addAttribute("genderTypes", genderTypes);
			return "editTeacherProfile";
		}
		else {
			teacherdao.saveOrUpdate(teacher);
			return "redirect:/teacher/dashboard";
		}
		
	}
	
	@RequestMapping(value="/teacher/editProfile/editLanguages",method=RequestMethod.GET)
	public String editLanguages(Model model, Principal principal) {
		TeacherLanguages teacherLanguages=new TeacherLanguages();
		model.addAttribute("teacherLanguages",teacherLanguages);
		return "editTeacherLanguagesProfile";
	}
	
	@RequestMapping(value="/teacher/editProfile/editLanguages",method=RequestMethod.POST)
	public String editLanguagesProcess(@Valid @ModelAttribute("teacherLanguages") TeacherLanguages teacherLanguages,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			return "editTeacherLanguagesProfile";
		}
		else {
			teacherdao.insertLanguages(teacherLanguages, principal.getName());
			return "redirect:/teacher/dashboard";
		}
		
	}
	
	@RequestMapping(value = "/teacher/reportSection")
	public String reportSection(Model model, Principal principal) {
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			List<Report> reportListByTeacher=reportdao.getReportsByTeacher(teacher.getTeacherID());
			model.addAttribute("teacher",teacher);
			model.addAttribute("reportListByTeacher",reportListByTeacher);
			model.addAttribute("reportCountByTeacher",reportdao.getReportCountByTeacher(teacher.getTeacherID()));
			return "teacherReportSection";
	}
	
	@RequestMapping(value="/teacher/reportSection/addReport",method=RequestMethod.GET)
	public String addReport(Model model, Principal principal) {
		
		Report report=new Report();
		LocalDate currentDate = LocalDate.now();
		Date date = java.sql.Date.valueOf(currentDate);
		report.setDate(date);
		model.addAttribute("report",report);
		List<Student>students=studentdao.getAll();
		Map< String, String > studentTypes = new HashMap<String, String>();
		for(Student student1:students) {
			studentTypes.put(student1.getStudentID(), student1.getStudentID());
		}
		model.addAttribute("studentTypes", studentTypes);
		return "addReportByTeacher";
	}
	
	@RequestMapping(value="/teacher/reportSection/addReport",method=RequestMethod.POST)
	public String addReportProcess(@Valid @ModelAttribute("report") Report report,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			List<Student>students=studentdao.getAll();
			Map< String, String > studentTypes = new HashMap<String, String>();
			for(Student student1:students) {
				studentTypes.put(student1.getStudentID(), student1.getStudentID());
			}
			model.addAttribute("studentTypes", studentTypes);
			return "addReportByTeacher";
		}
		else {
			reportdao.insertReportByTeacher(report, principal.getName());
			return "redirect:/teacher/reportSection";
		}
		
	}
	
	@RequestMapping(value="/teacher/reportSection/editReport/{id}",method=RequestMethod.GET)
	public String editReport(Model model, @PathVariable String id) {

		Report report=reportdao.getReport(id);
		model.addAttribute("report",report);
		List<Student>students=studentdao.getAll();
		Map< String, String > studentTypes = new HashMap<String, String>();
		for(Student student1:students) {
			studentTypes.put(student1.getStudentID(), student1.getStudentID());
		}
		model.addAttribute("studentTypes", studentTypes);
		return "editReportByTeacher";
	}
	
	@RequestMapping(value="/teacher/reportSection/editReport/{id}",method=RequestMethod.POST)
	public String editReportProcess(@Valid @ModelAttribute("report") Report report,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			List<Student>students=studentdao.getAll();
			Map< String, String > studentTypes = new HashMap<String, String>();
			for(Student student1:students) {
				studentTypes.put(student1.getStudentID(), student1.getStudentID());
			}
			model.addAttribute("studentTypes", studentTypes);
			return "editReportByTeacher";
		}
		else {
			System.out.println("2");
			reportdao.saveOrUpdateByAdmin(report);
			return "redirect:/teacher/reportSection";
		}
		
	}
	
	@RequestMapping(value="/teacher/reportSection/deleteReport/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteReport(@PathVariable String id){  
		reportdao.delete(id);  
        return new ModelAndView("redirect:/teacher/reportSection");  
    }
	
	@RequestMapping(value = "/teacher/homeworkSection")
	public String homeworkSection(Model model, Principal principal) {
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			List<Homework> homeworkListByTeacher=homeworkdao.getHomeworksByTeacher(teacher.getTeacherID());
			model.addAttribute("teacher",teacher);
			model.addAttribute("homeworkListByTeacher",homeworkListByTeacher);
			model.addAttribute("homeworkCountByTeacher",homeworkdao.getHomeworkCountByTeacher(teacher.getTeacherID()));
			return "teacherHomeworkSection";
	}
	/*
	@RequestMapping(value = "/teacher/homeworkSection/{id}")
	public String homeworkStudentsSection(Model model, Principal principal, @PathVariable String id) {
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			List<HomeworkOfStudent> StudentsByTeacherHomework=homeworkdao.getStudentsByTeacherHomework(teacher.getTeacherID(),id);
			model.addAttribute("teacher",teacher);
			model.addAttribute("homeworkID",id);
			model.addAttribute("StudentsByTeacherHomework",StudentsByTeacherHomework);
			model.addAttribute("StudentCountByTeacherHomework",homeworkdao.getStudentCountByTeacherHomework(teacher.getTeacherID()));
			return "teacherHomeworkSectionStudents";
	}
	
	@RequestMapping(value = "/teacher/homeworkSection/{id}/send",method=RequestMethod.GET)
	public String homeworkSendToStudentsSection(Model model, @PathVariable String id) {
		System.out.println(homeworkdao.getHomework(id));
		List<Student>students= studentdao.getStudentsBySubject(homeworkdao.getHomework(id).getSubjectCode());
	        for(Student student:students) {
	    	  System.out.println(student.getStudentID());
	    	  System.out.println(id);
	    	  homeworkdao.insertHomeworkOfStudent(homeworkdao.getHomework(id), student.getStudentID());
		}
			return "redirect:/teacher/homeworkSection/{id}";
	}*/
	
	@RequestMapping(value="/teacher/homeworkSection/addHomework",method=RequestMethod.GET)
	  public String addHomework(Model model, Principal principal) {
	    
	    Homework homework=new Homework();
	    LocalDate currentDate = LocalDate.now();
	    Date date = java.sql.Date.valueOf(currentDate);
	    homework.setDate(date);
	    model.addAttribute("homework",homework);
	    List<Subject> subjects = subjectdao.getSubjectsByTeacher(principal.getName());
	    Map< String, String > subjectTypes = new HashMap<String, String>();
	      for(Subject subject1:subjects) {
	        subjectTypes.put(subject1.getSubjectCode(), subject1.getSubjectCode());
	      }
	      model.addAttribute("subjectTypes", subjectTypes);
	    return "addHomework";
	  }
	  
	  @RequestMapping(value="/teacher/homeworkSection/addHomework",method=RequestMethod.POST)
	  public String addHomeworkProcess(@Valid @ModelAttribute("homework") Homework homework,BindingResult result,Model model, Principal principal) {
	    if(result.hasErrors()) {
	    	List<Subject> subjects = subjectdao.getSubjectsByTeacher(principal.getName());
		    Map< String, String > subjectTypes = new HashMap<String, String>();
		      for(Subject subject1:subjects) {
		        subjectTypes.put(subject1.getSubjectCode(), subject1.getSubjectCode());
		      }
		      model.addAttribute("subjectTypes", subjectTypes);
	      return "addHomework";
	    }
	    else {
	      homeworkdao.insertHomeworkByTeacher(homework, principal.getName());
	      return "redirect:/teacher/homeworkSection";
	    }
	  }
	  
	  @RequestMapping(value="/teacher/homeworkSection/editStatus/{id}",method=RequestMethod.GET)
	  public String editStatus(Model model, Principal principal,@PathVariable String id) {
	    List<Student> students = studentdao.getStudentsBySubject(homeworkdao.getHomework(id).getSubjectCode());
	    StatusList statusList= new StatusList ();
	    List<HomeworkOfStudent> homeworks= new ArrayList<HomeworkOfStudent>();
	    for(int i = 0; i < students.size(); i++) {
//	    	System.out.println(i);
	      HomeworkOfStudent homework=new HomeworkOfStudent();
	      homework.setHomeworkID(Integer.parseInt(id));
	      homework.setStudentID(students.get(i).getStudentID());
	      homeworks.add(homework);
	    }
	    statusList.setStatus(homeworks);
	    model.addAttribute("statusList", statusList);
	    StatusList oldStatusList=statusList;
	    model.addAttribute("oldStatusList", oldStatusList);
//	    homeworks=statusList.getStatus();
//	    for (HomeworkOfStudent homework : homeworks) {
////        	System.out.println(homework.getHomeworkID().toString());
////        	System.out.println(homework.getStudentID());
//        }
	    return "editStatus";
	  }
	  
	  @RequestMapping(value="/teacher/homeworkSection/editStatus/{id}",method=RequestMethod.POST)
	  public String editStatusProcess(@Valid @ModelAttribute("statusList") StatusList statusList,@ModelAttribute("oldStatusList") StatusList oldStatusList,BindingResult result,Model model,@PathVariable String id) {
	    if(result.hasErrors()) {
	      System.out.println("1");
	      return "editStatus";
	    }
	    else {
	      System.out.println("2");
	      
	      List<HomeworkOfStudent> homeworks=oldStatusList.getStatus();
	      System.out.println(homeworks.size());
	      if(null != homeworks && homeworks.size() > 0) {
	        for (HomeworkOfStudent homework : homeworks) {
	        	System.out.println(homework.getHomeworkID().toString());
	        	System.out.println(homework.getStudentID());
	          homeworkdao.deleteHomeworkOfStudent(homework.getHomeworkID().toString(),homework.getStudentID());
	        }
	      }
	      homeworks=statusList.getStatus();
	      System.out.println(homeworks.size());
	      if(null != homeworks && homeworks.size() > 0) {
	        for (HomeworkOfStudent homework : homeworks) {
	        	System.out.println(homework.getHomeworkID().toString());
	        	System.out.println(homework.getStudentID());
	          homeworkdao.insertHomeworkOfStudentStatus(homework);
	        }
	      }
	      model.addAttribute("statusList", statusList);
	      return "showStatus";
	    }
	    
	  }
	
	@RequestMapping(value = "/teacher/scheduleSection")
	public String scheduleSection(Model model, Principal principal) {
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			List<Schedule> scheduleListByTeacher=scheduledao.getScheduleByTeacher(teacher.getTeacherID());
			model.addAttribute("teacher",teacher);
			model.addAttribute("scheduleListByTeacher",scheduleListByTeacher);
			return "teacherScheduleSection";
	}
	
	@RequestMapping(value = "/teacher/attendanceSection")
	public String attendanceSection(Model model, Principal principal) {
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			LocalDate currentDate = LocalDate.now();
	        DayOfWeek dow = currentDate.getDayOfWeek();
//			System.out.println( "46523471256666666666666666666666666666666666666666131826871777777777777777432" );
	        List<Schedule> scheduleListByDay = scheduledao.getScheduleByDay(dow.toString());
//	        System.out.println(dow.toString());
//	        System.out.println(currentDate.toString());
//	        getDisplayName(TextStyle.FULL, Locale.getDefault())
	        model.addAttribute("teacher",teacher);
	        model.addAttribute("currentDate",currentDate.toString());
	        model.addAttribute("day",dow.toString());
			model.addAttribute("scheduleListByDay",scheduleListByDay);
			return "teacherAttendanceSection";
	}
	
//	@RequestMapping(value="/teacher/attendanceSection/markAttendance/{periodNo}/{subjectCode}",method=RequestMethod.GET)
//	public String markAttendance(Model model, Principal principal,@PathVariable Integer periodNo,@PathVariable String subjectCode) {
//		Teacher teacher=teacherdao.getTeacher(principal.getName());
//		List<String> studentIDs = studentdao.getStudentsBySubject(subjectCode);
//		List<Student> students= new ArrayList<Student>();
//		Map< Student, Attendance > studentAttendance = new HashMap<Student, Attendance>();
//		LocalDate currentDate = LocalDate.now();
//		Date date = java.sql.Date.valueOf(currentDate);
//        
//		for (int i = 0; i < studentIDs.size(); i++) {
//			Student x = studentdao.getStudent(studentIDs.get(i));
//			students.add(x);
//			Attendance attendance=new Attendance();
//			attendance.setDate(date);
//			attendance.setPeriodNo(periodNo);
//			attendance.setStudentID(studentIDs.get(i));
//			studentAttendance.put(x, attendance);
//		}
//		model.addAttribute("currentDate",date.toString());
//		model.addAttribute("students",students);
//		model.addAttribute("studentAttendance", studentAttendance);
//		
//		return "markAttendance";
//	}
	
	@RequestMapping(value="/teacher/attendanceSection/markAttendance/{periodNo}/{subjectCode}",method=RequestMethod.GET)
	public String markAttendance(Model model, Principal principal,@PathVariable Integer periodNo,@PathVariable String subjectCode) {
		Teacher teacher=teacherdao.getTeacher(principal.getName());
		List<Student> students = studentdao.getStudentsBySubject(subjectCode);
//		List<Student> students= new ArrayList<Student>();
		AttendanceList attendanceList= new AttendanceList ();
		List<Attendance> attendances= new ArrayList<Attendance>();
//		Map< Student, Attendance > studentAttendance = new HashMap<Student, Attendance>();
		LocalDate currentDate = LocalDate.now();
		Date date = java.sql.Date.valueOf(currentDate);
        
		for (int i = 0; i < students.size(); i++) {
//			Student x = studentdao.getStudent(studentIDs.get(i));
//			students.add(x);
			Attendance attendance=new Attendance();
			attendance.setDate(date);
			attendance.setPeriodNo(periodNo);
			attendance.setStudentID(students.get(i).getStudentID());
			attendances.add(attendance);
//			studentAttendance.put(x, attendance);
		}
		attendanceList.setAttendances(attendances);
		model.addAttribute("currentDate",date.toString());
//		model.addAttribute("students",students);
//		model.addAttribute("studentAttendance", studentAttendance);
//		model.addAttribute("attendances", attendances);
		model.addAttribute("attendanceList", attendanceList);
		AttendanceList oldAttendanceList=attendanceList;
		model.addAttribute("oldAttendanceList", oldAttendanceList);
		Map< String, String > attendanceTypes = new HashMap<String, String>();
		attendanceTypes.put("Present", "Present");
		attendanceTypes.put("Absent", "Absent");
		attendanceTypes.put("Late", "Late");
        model.addAttribute("attendanceTypes", attendanceTypes);
		
		return "markAttendance";
	}
	
	@RequestMapping(value="/teacher/attendanceSection/markAttendanceResult",method=RequestMethod.POST)
	public String markAttendanceProcess(@Valid @ModelAttribute("attendanceList") AttendanceList attendanceList,@ModelAttribute("oldAttendanceList") AttendanceList oldAttendanceList,BindingResult result,Model model) {
		if(result.hasErrors()) {
			System.out.println("1");
			Map< String, String > attendanceTypes = new HashMap<String, String>();
			attendanceTypes.put("Present", "Present");
			attendanceTypes.put("Absent", "Absent");
			attendanceTypes.put("Late", "Late");
	        model.addAttribute("attendanceTypes", attendanceTypes);
			return "markAttendance";
		}
		else {
			System.out.println("2");
			List<Attendance> attendances=oldAttendanceList.getAttendances();
			if(null != attendances && attendances.size() > 0) {
				for (Attendance attendance : attendances) {
					attendancedao.delete1(attendance.getDate(),attendance.getPeriodNo().toString(),attendance.getStudentID());
				}
			}
			attendances=attendanceList.getAttendances();
			if(null != attendances && attendances.size() > 0) {
				for (Attendance attendance : attendances) {
					attendancedao.insertAttendance(attendance);
//					System.out.printf("%s \t %s \n", attendance.getFirstname(), attendances.getLastname());
				}
			}
			LocalDate currentDate = LocalDate.now();
			Date date = java.sql.Date.valueOf(currentDate);
			model.addAttribute("currentDate",date.toString());
			model.addAttribute("attendanceList", attendanceList);
			return "showAttendance";
		}
	}
	
	@RequestMapping(value = "/teacher/examSection")
	public String examSection(Model model, Principal principal) {
			Teacher teacher=teacherdao.getTeacher(principal.getName());
			List<Exam> exams = examdao.getExamsByTeacher(teacher.getTeacherID());
	        model.addAttribute("exams",exams);
			return "teacherExamSection";
	}
	
	@RequestMapping(value="/teacher/examSection/editMarks/{date}/{type}/{subjectCode}",method=RequestMethod.GET)
	public String editMarks(Model model, Principal principal,@PathVariable("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,@PathVariable String type,@PathVariable String subjectCode) {
		Teacher teacher=teacherdao.getTeacher(principal.getName());
		List<Student> students = studentdao.getStudentsBySubject(subjectCode);
		MarksList marksList= new MarksList ();
		List<MarksInExam> marks= new ArrayList<MarksInExam>();
		for(int i = 0; i < students.size(); i++) {
			MarksInExam mark=new MarksInExam();
//			System.out.println(date);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	        String strDate = dateFormat.format(date); 
//	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy", Locale.ENGLISH);
//	        LocalDate date1 = LocalDate.parse(strDate, formatter);
//	        System.out.println(strDate);
			mark.setDate(strDate);
			mark.setType(type);
			mark.setSubjectCode(subjectCode);
			mark.setStudentID(students.get(i).getStudentID());
			marks.add(mark);
		}
		marksList.setMarks(marks);
		model.addAttribute("marksList", marksList);
		MarksList oldMarksList=marksList;
		model.addAttribute("oldMarksList", oldMarksList);
		
		
		return "editMarks";
	}
	
	@RequestMapping(value="/teacher/examSection/editMarksResult",method=RequestMethod.POST)
	public String editMarksProcess(@Valid @ModelAttribute("marksList") MarksList marksList,@ModelAttribute("oldMarksList") MarksList oldMarksList,BindingResult result,Model model) {
		if(result.hasErrors()) {
			System.out.println("1");
			return "editMarks";
		}
		else {
			System.out.println("2");
			List<MarksInExam> marks=oldMarksList.getMarks();
			if(null != marks && marks.size() > 0) {
				for (MarksInExam mark : marks) {
					examdao.deleteMarksInExam(mark.getDate(),mark.getType(),mark.getSubjectCode());
				}
			}
			marks=marksList.getMarks();
			if(null != marks && marks.size() > 0) {
				for (MarksInExam mark : marks) {
					examdao.insertMarksInExam(mark);
				}
			}
			model.addAttribute("marksList", marksList);
			return "showMarks";
		}
		
	}
	
}
