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

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import com.dbms.model.StudentLanguages;
import com.dbms.model.Teacher;
import com.dbms.model.Parent;
import com.dbms.model.Accountant;
import com.dbms.model.User;
import com.dbms.model.Class;
import com.dbms.model.Subject;
import com.dbms.model.Report;
import com.dbms.model.Homework;
import com.dbms.model.HomeworkOfStudent;
import com.dbms.model.HomeworkWithStatus;
import com.dbms.model.MarksInExam;
import com.dbms.model.MarksList;
import com.dbms.model.Bill;
import com.dbms.model.Attendance;
import com.dbms.model.Schedule;
import com.dbms.model.Exam;



@Controller
public class StudentController {

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
	
	
	
	
	@RequestMapping(value = "/student/dashboard")
	public String welcome(Model model, Principal principal) {
		
		/*if(principal != null)
		{*/
			Student student=studentdao.getStudent(principal.getName());
			model.addAttribute("student",student);
			model.addAttribute("topic","DASHBOARD");
			List<StudentHobbies> hobbies=studentdao.getHobbiesbyStudentID(principal.getName());
			model.addAttribute("hobbies",hobbies);
			List<StudentLanguages> languages= studentdao.getLanguagesbyStudentID(principal.getName());
			model.addAttribute("languages",languages);
			
//			for (StudentHobbies record : hobbies) {
//		         System.out.print("ID : " + record.getStudentID() );
//		         System.out.print(", Hobby : " + record.getHobby() );
//		      } 
//			for (int i = 0; i < hobbies.size(); i++) {
//				System.out.println(i);
//				System.out.println(hobbies.get(i));
//			}
			return "studentDashboard";
		
		//return null;
	}
	
	@RequestMapping(value="/profile/s/{id}",method = RequestMethod.GET)  
	public String studentProfile(Model model, @PathVariable String id) {
		Student student=studentdao.getStudent(id);
		model.addAttribute("student",student);
		model.addAttribute("topic",id+"'s Profile");
		List<StudentHobbies> hobbies=studentdao.getHobbiesbyStudentID(id);
		model.addAttribute("hobbies",hobbies);
		List<StudentLanguages> languages= studentdao.getLanguagesbyStudentID(id);
		model.addAttribute("languages",languages);
		return "studentDashboardByAdmin";
	}

	@RequestMapping(value="/student/editProfile",method=RequestMethod.GET)
	public String editProfile(Model model, Principal principal) {

		Student student=studentdao.getStudent(principal.getName());
		model.addAttribute("student",student);
		
		Map< String, String > genderTypes = new HashMap<String, String>();
		genderTypes.put("Male", "Male");
		genderTypes.put("Female", "Female");
		genderTypes.put("Other", "Other");
        model.addAttribute("genderTypes", genderTypes);
        Map< String, String > bloodTypes = new HashMap<String, String>();
        bloodTypes.put("A+", "A+");
        bloodTypes.put("B+", "B+");
        bloodTypes.put("O+", "O+");
        bloodTypes.put("AB+", "AB+");
        bloodTypes.put("A-", "A-");
        bloodTypes.put("B-", "B-");
        bloodTypes.put("O-", "O-");
        bloodTypes.put("AB-", "AB-");
        model.addAttribute("bloodTypes", bloodTypes);
        Map< String, String > categoryTypes = new HashMap<String, String>();
        categoryTypes.put("GEN", "GEN");
        categoryTypes.put("SC", "SC");
        categoryTypes.put("ST", "ST");
        categoryTypes.put("OBC", "OBC");
        model.addAttribute("categoryTypes", categoryTypes);
        

		return "editStudentProfile";
	}
	
	@RequestMapping(value="/student/editProfile",method=RequestMethod.POST)
	public String editProfileProcess(@Valid @ModelAttribute("student") Student student,BindingResult result,Model model) {
		if(result.hasErrors()) {
			Map< String, String > genderTypes = new HashMap<String, String>();
			genderTypes.put("Male", "Male");
			genderTypes.put("Female", "Female");
			genderTypes.put("Other", "Other");
	        model.addAttribute("genderTypes", genderTypes);
	        Map< String, String > bloodTypes = new HashMap<String, String>();
	        bloodTypes.put("A+", "A+");
	        bloodTypes.put("B+", "B+");
	        bloodTypes.put("O+", "O+");
	        bloodTypes.put("AB+", "AB+");
	        bloodTypes.put("A-", "A-");
	        bloodTypes.put("B-", "B-");
	        bloodTypes.put("O-", "O-");
	        bloodTypes.put("AB-", "AB-");
	        model.addAttribute("bloodTypes", bloodTypes);
	        Map< String, String > categoryTypes = new HashMap<String, String>();
	        categoryTypes.put("GEN", "GEN");
	        categoryTypes.put("SC", "SC");
	        categoryTypes.put("ST", "ST");
	        categoryTypes.put("OBC", "OBC");
	        model.addAttribute("categoryTypes", categoryTypes);
			return "editStudentProfile";
		}
		else {
			studentdao.saveOrUpdate(student);
			return "redirect:/student/dashboard";
		}
	}
	
	@RequestMapping(value="/student/editProfile/editHobbies",method=RequestMethod.GET)
	public String editHobbies(Model model, Principal principal) {
		
		StudentHobbies studentHobbies=new StudentHobbies();
		model.addAttribute("studentHobbies",studentHobbies);
		return "editStudentHobbiesProfile";
	}
	
	@RequestMapping(value="/student/editProfile/editHobbies",method=RequestMethod.POST)
	public String editHobbiesProcess(@Valid @ModelAttribute("studentHobbies") StudentHobbies studentHobbies,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			return "editStudentHobbiesProfile";
		}
		else {
			studentdao.insertHobbies(studentHobbies, principal.getName());
			return "redirect:/student/dashboard";
		}
		
	}
	
	@RequestMapping(value="/student/editProfile/editLanguages",method=RequestMethod.GET)
	public String editLanguages(Model model, Principal principal) {
		StudentLanguages studentLanguages=new StudentLanguages();
		model.addAttribute("studentLanguages",studentLanguages);
		return "editStudentLanguagesProfile";
	}
	
	@RequestMapping(value="/student/editProfile/editLanguages",method=RequestMethod.POST)
	public String editLanguagesProcess(@Valid @ModelAttribute("studentLanguages") StudentLanguages studentLanguages,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			return "editStudentLanguagesProfile";
		}
		else {
			studentdao.insertLanguages(studentLanguages, principal.getName());
			return "redirect:/student/dashboard";
		}
		
	}
	
	@RequestMapping(value = "/student/classSection")
	public String classSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			Class class1=classdao.getClass(student.getClassID());
			List<Subject> subjectListByClass=subjectdao.getSubjectsByClass(class1.getClassID());
			model.addAttribute("student",student);
			model.addAttribute("class1",class1);
			model.addAttribute("subjectListByClass",subjectListByClass);
			model.addAttribute("subjectCountByClass",subjectdao.getSubjectCountByClass(class1.getClassID()));
			
			return "studentClassSection";
	}
	
	@RequestMapping(value = "/student/reportSection")
	public String reportSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			List<Report> reportListByStudent=reportdao.getReportsByStudent(student.getStudentID());
			model.addAttribute("student",student);
			model.addAttribute("reportListByStudent",reportListByStudent);
			model.addAttribute("reportCountByStudent",reportdao.getReportCountByStudent(student.getStudentID()));
			return "studentReportSection";
	}
	
	@RequestMapping(value = "/student/homeworkSection")
	public String homeworkSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			List<HomeworkWithStatus> homeworkListByStudent=homeworkdao.getHomeworksByStudentStatus(student.getStudentID());
			model.addAttribute("student",student);
			model.addAttribute("homeworkListByStudent",homeworkListByStudent);
			model.addAttribute("homeworkCountByStudent",homeworkdao.getHomeworkCountByStudent(student.getStudentID()));
			return "studentHomeworkSection";
	}
	
	@RequestMapping(value = "/student/billSection")
	public String billSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			List<Bill> billListByStudent=billdao.getBillsByStudent(student.getStudentID());
			model.addAttribute("student",student);
			model.addAttribute("billListByStudent",billListByStudent);
			model.addAttribute("billCountByStudent",billdao.getBillCountByStudent(student.getStudentID()));
			return "studentBillSection";
	}
	
	@RequestMapping(value = "/student/scheduleSection")
	public String scheduleSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			List<Schedule> scheduleListByStudent=scheduledao.getScheduleByStudent(student.getStudentID());
			model.addAttribute("student",student);
			model.addAttribute("scheduleListByStudent",scheduleListByStudent);
			return "studentScheduleSection";
	}
	
	@RequestMapping(value = "/student/examSection")
	public String examSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			List<Exam> examListByStudent=examdao.getExamsByStudent(student.getStudentID());
			model.addAttribute("student",student);
			model.addAttribute("examListByStudent",examListByStudent);
			model.addAttribute("examCountByStudent",examdao.getExamCountByStudent(student.getStudentID()));
			return "studentExamSection";
	}
	
	@RequestMapping(value = "/student/attendanceSection")
	public String attendanceSection(Model model, Principal principal) {
			Student student=studentdao.getStudent(principal.getName());
			List<Attendance> attendanceListByStudent=attendancedao.getAttendanceByStudent(student.getStudentID());
			model.addAttribute("student",student);
			model.addAttribute("attendanceListByStudent",attendanceListByStudent);
			return "studentAttendanceSection";
	}
	
//	PROBLEM
	@RequestMapping(value="/student/examSection/viewMarks/{date}/{type}/{subjectCode}",method=RequestMethod.GET)
	public String editMarks(Model model, Principal principal,@PathVariable("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,@PathVariable String type,@PathVariable String subjectCode) {
//		List<Student> students = studentdao.getStudentsBySubject(subjectCode);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = dateFormat.format(date);
        System.out.println(strDate);
        System.out.println(type);
        System.out.println(subjectCode);
		List<MarksInExam> marksList= examdao.getAllMarksByExam(strDate,type,subjectCode);
		model.addAttribute("marksList", marksList);
		return "viewMarks";
	}
	
}
