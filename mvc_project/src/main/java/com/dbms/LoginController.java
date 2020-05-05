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
import com.dbms.model.Teacher;
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
import com.dbms.model.Schedule;
import com.dbms.model.Exam;


@Controller
public class LoginController {

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
	
	
	@RequestMapping(value = "/")
	public String welcome(Model model, Principal principal) {
		
		if(principal != null)
		{
			User user=userdao.getUser(principal.getName());
			String type=user.getType();
//			System.out.println(user.getName());
//			System.out.println(type);
			
			if(type.equals("admin"))return "redirect:/admin";
			else if(type.equals("student"))return "redirect:/student";
			else if(type.equals("teacher"))return "redirect:/teacher";
			else if(type.equals("accountant"))return "redirect:/accountant";
			else if(type.equals("parent"))return "redirect:/parent";
			
		}
		
		
//		model.addAttribute("name", "Home Page");
//		model.addAttribute("description", "Please login with appropriate credentials.");
		return "redirect:/login";
	}

	@RequestMapping("/admin")
	public String admin(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		model.addAttribute("name", "Spring Security Admin Login Demo");
		model.addAttribute("description", "Admin Login Page!");
		
		List<Student> studentList=studentdao.getAll();
		List<Teacher> teacherList=teacherdao.getAll();
		List<Parent> parentList=parentdao.getAll();
		List<Accountant> accountantList=accountantdao.getAll();
		List<Class> classList=classdao.getAll();
		List<Subject> subjectList=subjectdao.getAll();
		List<Report> reportList=reportdao.getAll();
		List<Schedule> scheduleList=scheduledao.getAll();
		List<Exam> examList=examdao.getAll();
		
		
		model.addAttribute("studentList",studentList);
		model.addAttribute("teacherList",teacherList);
		model.addAttribute("parentList",parentList);
		model.addAttribute("accountantList",accountantList);
		model.addAttribute("classList",classList);
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("reportList",reportList);
		model.addAttribute("scheduleList",scheduleList);
		model.addAttribute("examList",examList);
		
		
		int studentCount=studentdao.getCount();
		int teacherCount=teacherdao.getCount();
		int parentCount=parentdao.getCount();
		int accountantCount=accountantdao.getCount();
		int classCount=classdao.getCount();
		int subjectCount=subjectdao.getCount();
		int reportCount=reportdao.getCount();
		
		model.addAttribute("studentCount",studentCount);
		model.addAttribute("teacherCount",teacherCount);
		model.addAttribute("parentCount",parentCount);
		model.addAttribute("accountantCount",accountantCount);
		model.addAttribute("classCount",classCount);
		model.addAttribute("subjectCount",subjectCount);
		model.addAttribute("reportCount",reportCount);
		
		return "admin";
	}
	@RequestMapping("/teacher")
	public String teacher(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		return "redirect:/teacher/dashboard";
	}
	@RequestMapping("/student")
	public String student(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		return "redirect:/student/dashboard";
	}
	@RequestMapping("/parent")
	public String parent(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		return "redirect:/parent/dashboard";
	}
	@RequestMapping("/accountant")
	public String accountant(Model model, Principal principal) {

		String loggedInUserName = principal.getName();
		model.addAttribute("user", loggedInUserName);
		return "redirect:/accountant/dashboard";
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {

		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {

		model.addAttribute("message",
				"You have successfully logged off from application !");
		return "logout";
	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
	}
	
	@RequestMapping(value="/admin/register",method=RequestMethod.GET)
	public String register(Model model) {
		
		Map< String, String > types = new HashMap<String, String>();
        types.put("teacher", "Teacher");
        types.put("student", "Student");
        types.put("parent", "Parent");
        types.put("accountant", "Accountant");
         
        model.addAttribute("typesList", types);
		
		User user = new User();
		model.addAttribute("user", user);

		return "register";
	}
	
	@RequestMapping(value="/admin/register",method=RequestMethod.POST)
	public String registerProcess(@Valid @ModelAttribute("user") User user,BindingResult result,Model model) {
		if(result.hasErrors()) {
			Map< String, String > types = new HashMap<String, String>();
	        types.put("teacher", "Teacher");
	        types.put("student", "Student");
	        types.put("parent", "Parent");
	        types.put("accountant", "Accountant");
	         
	        model.addAttribute("typesList", types);
			return "register";
		}
		else {
			if(!user.getPassword().equals(user.getMpassword())) {
				model.addAttribute("error","Passwords not matching!");
				Map< String, String > types = new HashMap<String, String>();
		        types.put("teacher", "Teacher");
		        types.put("student", "Student");
		        types.put("parent", "Parent");
		        types.put("accountant", "Accountant");
		         
		        model.addAttribute("typesList", types);
				return "register";
			}
			if(userdao.getUser(user.getUsername())!=null) {
				model.addAttribute("error", "Username already exists!");
				Map< String, String > types = new HashMap<String, String>();
		        types.put("teacher", "Teacher");
		        types.put("student", "Student");
		        types.put("parent", "Parent");
		        types.put("accountant", "Accountant");
		         
		        model.addAttribute("typesList", types);
				return "register";
			}
			userdao.saveOrUpdate(user);
			return "redirect:/admin";
		}
	}
	
	@RequestMapping(value="/admin/deleteStudent/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteStudent(@PathVariable String id){  
		studentdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteTeacher/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteTeacher(@PathVariable String id){  
		teacherdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteParent/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteParent(@PathVariable String id){  
		parentdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteAccountant/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteAccountant(@PathVariable String id){  
		accountantdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteClass/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteClass(@PathVariable String id){  
		classdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteSubject/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteSubject(@PathVariable String id){  
		subjectdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteReport/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteReport(@PathVariable String id){  
		reportdao.delete(id);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteSchedule/{day}/{periodNo}/{classID}/{teacherID}/{subjectCode}",method = RequestMethod.GET)  
    public ModelAndView deleteReport(@PathVariable String day,@PathVariable Integer periodNo,@PathVariable String classID,@PathVariable String teacherID,@PathVariable String subjectCode){  
		scheduledao.delete(day,periodNo,classID,teacherID,subjectCode);  
        return new ModelAndView("redirect:/admin");  
    }
	
	@RequestMapping(value="/admin/deleteExam/{date}/{type}/{subjectCode}",method = RequestMethod.GET)  
    public ModelAndView deleteExam(@PathVariable("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,@PathVariable String type,@PathVariable String subjectCode){  
		examdao.delete(date,type,subjectCode);
        return new ModelAndView("redirect:/admin");
    }
    
	
	@RequestMapping(value="/admin/editStudent/{id}",method=RequestMethod.GET)
	public String editStudentProfile(Model model, @PathVariable String id) {

		Student student=studentdao.getStudent(id);
		model.addAttribute("student",student);
		List<Parent>parents=parentdao.getAll();
		Map< String, String > parentTypes = new HashMap<String, String>();
		for(Parent parent:parents) {
			parentTypes.put(parent.getParentID(), parent.getParentID());
		}
        model.addAttribute("parentTypes", parentTypes);
        List<Class>classes=classdao.getAll();
		Map< String, String > classTypes = new HashMap<String, String>();
		for(Class class1:classes) {
			classTypes.put(class1.getClassID(), class1.getClassID());
		}
        model.addAttribute("classTypes", classTypes);
		return "editStudentByAdmin";
	}
	
	@RequestMapping(value="/admin/editStudent/{id}",method=RequestMethod.POST)
	public String editStudentProfileProcess(@Valid @ModelAttribute("student") Student student,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			List<Parent>parents=parentdao.getAll();
			Map< String, String > parentTypes = new HashMap<String, String>();
			for(Parent parent:parents) {
				parentTypes.put(parent.getParentID(), parent.getParentID());
			}
	        model.addAttribute("parentTypes", parentTypes);
	        List<Class>classes=classdao.getAll();
			Map< String, String > classTypes = new HashMap<String, String>();
			for(Class class1:classes) {
				classTypes.put(class1.getClassID(), class1.getClassID());
			}
	        model.addAttribute("classTypes", classTypes);
			return "editStudentByAdmin";
		}
		else {
			System.out.println("2");
			studentdao.saveOrUpdateByAdmin(student);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/editTeacher/{id}",method=RequestMethod.GET)
	public String editTeacherProfile(Model model, @PathVariable String id) {

		Teacher teacher=teacherdao.getTeacher(id);
		model.addAttribute("teacher",teacher);
		return "editTeacherByAdmin";
	}
	
	@RequestMapping(value="/admin/editTeacher/{id}",method=RequestMethod.POST)
	public String editTeacherProfileProcess(@Valid @ModelAttribute("teacher") Teacher teacher,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			return "editTeacherByAdmin";
		}
		else {
			teacherdao.saveOrUpdateByAdmin(teacher);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/editAccountant/{id}",method=RequestMethod.GET)
	public String editAccountantProfile(Model model, @PathVariable String id) {

		Accountant accountant=accountantdao.getAccountant(id);
		model.addAttribute("accountant",accountant);
		return "editAccountantByAdmin";
	}
	
	@RequestMapping(value="/admin/editAccountant/{id}",method=RequestMethod.POST)
	public String editAccountantProfileProcess(@Valid @ModelAttribute("accountant") Accountant accountant,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			System.out.println("1");
			return "editAccountantByAdmin";
		}
		else {
			System.out.println("2");
			accountantdao.saveOrUpdateByAdmin(accountant);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/editClass/{id}",method=RequestMethod.GET)
	public String editClass(Model model, @PathVariable String id) {

		Class class1=classdao.getClass(id);
		model.addAttribute("class1",class1);
		return "editClassByAdmin";
	}
	
	@RequestMapping(value="/admin/editClass/{id}",method=RequestMethod.POST)
	public String editClassProcess(@Valid @ModelAttribute("class1") Class class1,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			System.out.println("1");
			return "editClassByAdmin";
		}
		else {
			System.out.println("2");
			classdao.saveOrUpdateByAdmin(class1);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/addClass",method=RequestMethod.GET)
	public String addClass(Model model) {
		
		Class class1=new Class();
		model.addAttribute("class1",class1);
		return "addClass";
	}
	
	@RequestMapping(value="/admin/addClass",method=RequestMethod.POST)
	public String addClassProcess(@Valid @ModelAttribute("class1") Class class1,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "addClass";
		}
		else {
			classdao.insertClass(class1);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/editSubject/{id}",method=RequestMethod.GET)
	public String editSubject(Model model, @PathVariable String id) {

		Subject subject=subjectdao.getSubject(id);
		model.addAttribute("subject",subject);
		List<Class>classes=classdao.getAll();
		Map< String, String > classTypes = new HashMap<String, String>();
		for(Class class1:classes) {
			classTypes.put(class1.getClassID(), class1.getClassID());
		}
        model.addAttribute("classTypes", classTypes);
        Map< String, String > choicesTypes = new HashMap<String, String>();
        choicesTypes.put("Yes", "Yes");
        choicesTypes.put("No", "No");
        model.addAttribute("choicesTypes", choicesTypes);
		return "editSubjectByAdmin";
	}
	
	@RequestMapping(value="/admin/editSubject/{id}",method=RequestMethod.POST)
	public String editSubjectProcess(@Valid @ModelAttribute("subject") Subject subject,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			List<Class>classes=classdao.getAll();
			Map< String, String > classTypes = new HashMap<String, String>();
			for(Class class1:classes) {
				classTypes.put(class1.getClassID(), class1.getClassID());
			}
	        model.addAttribute("classTypes", classTypes);
	        Map< String, String > choicesTypes = new HashMap<String, String>();
	        choicesTypes.put("Yes", "Yes");
	        choicesTypes.put("No", "No");
	        model.addAttribute("choicesTypes", choicesTypes);
			return "editSubjectByAdmin";
		}
		else {
			subjectdao.saveOrUpdateByAdmin(subject);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/addSubject",method=RequestMethod.GET)
	public String addSubject(Model model) {
		
		Subject subject=new Subject();
		model.addAttribute("subject",subject);
		List<Class>classes=classdao.getAll();
		Map< String, String > classTypes = new HashMap<String, String>();
		for(Class class1:classes) {
			classTypes.put(class1.getClassID(), class1.getClassID());
		}
        model.addAttribute("classTypes", classTypes);
        Map< String, String > choicesTypes = new HashMap<String, String>();
        choicesTypes.put("Yes", "Yes");
        choicesTypes.put("No", "No");
        model.addAttribute("choicesTypes", choicesTypes);
		return "addSubject";
	}
	
	@RequestMapping(value="/admin/addSubject",method=RequestMethod.POST)
	public String addSubjectProcess(@Valid @ModelAttribute("subject") Subject subject,BindingResult result,Model model) {
		if(result.hasErrors()) {
			List<Class>classes=classdao.getAll();
			Map< String, String > classTypes = new HashMap<String, String>();
			for(Class class1:classes) {
				classTypes.put(class1.getClassID(), class1.getClassID());
			}
	        model.addAttribute("classTypes", classTypes);
	        Map< String, String > choicesTypes = new HashMap<String, String>();
	        choicesTypes.put("Yes", "Yes");
	        choicesTypes.put("No", "No");
	        model.addAttribute("choicesTypes", choicesTypes);
			return "addSubject";
		}
		else {
			subjectdao.insertSubject(subject);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/editReport/{id}",method=RequestMethod.GET)
	public String editReport(Model model, @PathVariable String id) {

		Report report=reportdao.getReport(id);
		model.addAttribute("report",report);
		List<Teacher>teachers=teacherdao.getAll();
		Map< String, String > teacherTypes = new HashMap<String, String>();
		for(Teacher teacher1:teachers) {
			teacherTypes.put(teacher1.getTeacherID(), teacher1.getTeacherID());
		}
		model.addAttribute("teacherTypes", teacherTypes);
		List<Student>students=studentdao.getAll();
		Map< String, String > studentTypes = new HashMap<String, String>();
		for(Student student1:students) {
			studentTypes.put(student1.getStudentID(), student1.getStudentID());
		}
		model.addAttribute("studentTypes", studentTypes);
		return "editReportByAdmin";
	}
	
	@RequestMapping(value="/admin/editReport/{id}",method=RequestMethod.POST)
	public String editReportProcess(@Valid @ModelAttribute("report") Report report,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			List<Teacher>teachers=teacherdao.getAll();
			Map< String, String > teacherTypes = new HashMap<String, String>();
			for(Teacher teacher1:teachers) {
				teacherTypes.put(teacher1.getTeacherID(), teacher1.getTeacherID());
			}
			model.addAttribute("teacherTypes", teacherTypes);
			List<Student>students=studentdao.getAll();
			Map< String, String > studentTypes = new HashMap<String, String>();
			for(Student student1:students) {
				studentTypes.put(student1.getStudentID(), student1.getStudentID());
			}
			model.addAttribute("studentTypes", studentTypes);
			return "editReportByAdmin";
		}
		else {
			reportdao.saveOrUpdateByAdmin(report);
			return "redirect:/admin";
		}
		
	}
	
//	@RequestMapping(value="/admin/editSchedule/{day}/{periodNo}/{classID}/{teacherID}/{subjectCode}",method=RequestMethod.GET)
//	public String editSchedule(Model model,@PathVariable String day,@PathVariable Integer periodNo,@PathVariable String classID,@PathVariable String teacherID,@PathVariable String subjectCode) {
//
//		scheduledao.delete(day,periodNo,classID,teacherID,subjectCode);
//		model.addAttribute("schedule",new Schedule());
//		return "editSchedule";
//	}
//	
//	@RequestMapping(value="/admin/editScheduleResult",method=RequestMethod.POST)
//	public String editScheduleProcess(@Valid @ModelAttribute("schedule") Schedule schedule,BindingResult result,Model model) {
//		if(result.hasErrors()) {
//			System.out.println("1");
//			return "editSchedule";
//		}
//		else {
//			System.out.println("2");
//			scheduledao.insertSchedule(schedule);
//			return "redirect:/admin";
//		}
//		
//	}
	
	@RequestMapping(value="/admin/addSchedule",method=RequestMethod.GET)
	public String addSchedule(Model model, Principal principal) {
		
		Schedule schedule=new Schedule();
		model.addAttribute("schedule",schedule);
		List<Teacher>teachers=teacherdao.getAll();
		Map< String, String > teacherTypes = new HashMap<String, String>();
		for(Teacher teacher1:teachers) {
			teacherTypes.put(teacher1.getTeacherID(), teacher1.getTeacherID());
		}
		model.addAttribute("teacherTypes", teacherTypes);
		List<Class>classes=classdao.getAll();
		Map< String, String > classTypes = new HashMap<String, String>();
		for(Class class1:classes) {
			classTypes.put(class1.getClassID(), class1.getClassID());
		}
        model.addAttribute("classTypes", classTypes);
        Map< String, String > dayTypes = new HashMap<String, String>();
        dayTypes.put("Sunday", "Sunday");
        dayTypes.put("Monday", "Monday");
        dayTypes.put("Tuesday", "Tuesday");
        dayTypes.put("Wednesday", "Wednesday");
        dayTypes.put("Thursday", "Thursday");
        dayTypes.put("Friday", "Friday");
        dayTypes.put("Saturday", "Saturday");
        model.addAttribute("dayTypes", dayTypes);
        List<Subject>subjects=subjectdao.getAll();
		Map< String, String > subjectTypes = new HashMap<String, String>();
		for(Subject subject1:subjects) {
			subjectTypes.put(subject1.getSubjectCode(), subject1.getSubjectCode());
		}
		model.addAttribute("subjectTypes", subjectTypes);
		return "addSchedule";
	}
	
	@RequestMapping(value="/admin/addSchedule",method=RequestMethod.POST)
	public String addScheduleProcess(@Valid @ModelAttribute("schedule") Schedule schedule,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			List<Teacher>teachers=teacherdao.getAll();
			Map< String, String > teacherTypes = new HashMap<String, String>();
			for(Teacher teacher1:teachers) {
				teacherTypes.put(teacher1.getTeacherID(), teacher1.getTeacherID());
			}
			model.addAttribute("teacherTypes", teacherTypes);
			List<Class>classes=classdao.getAll();
			Map< String, String > classTypes = new HashMap<String, String>();
			for(Class class1:classes) {
				classTypes.put(class1.getClassID(), class1.getClassID());
			}
	        model.addAttribute("classTypes", classTypes);
	        Map< String, String > dayTypes = new HashMap<String, String>();
	        dayTypes.put("Sunday", "Sunday");
	        dayTypes.put("Monday", "Monday");
	        dayTypes.put("Tuesday", "Tuesday");
	        dayTypes.put("Wednesday", "Wednesday");
	        dayTypes.put("Thursday", "Thursday");
	        dayTypes.put("Friday", "Friday");
	        dayTypes.put("Saturday", "Saturday");
	        model.addAttribute("dayTypes", dayTypes);
	        List<Subject>subjects=subjectdao.getAll();
			Map< String, String > subjectTypes = new HashMap<String, String>();
			for(Subject subject1:subjects) {
				subjectTypes.put(subject1.getSubjectCode(), subject1.getSubjectCode());
			}
			model.addAttribute("subjectTypes", subjectTypes);
			return "addSchedule";
		}
		else {
			scheduledao.insertSchedule(schedule);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/editExam/{date}/{type}/{subjectCode}",method=RequestMethod.GET)
	public String editExam(Model model,@PathVariable("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,@PathVariable String type,@PathVariable String subjectCode) {

		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        String strDate = dateFormat.format(date);  
//		System.out.println(strDate);
//		System.out.println(exam.getRoomNo());
		Exam exam=examdao.getExam(strDate,type,subjectCode);
//		System.out.println("-22222222222222");
		model.addAttribute("exam",exam);
		return "editExam";
	}
	
	@RequestMapping(value="/admin/editExamResult",method=RequestMethod.POST)
	public String editExamProcess(@Valid @ModelAttribute("exam") Exam exam,BindingResult result,Model model) {
		if(result.hasErrors()) {
			System.out.println("1");
			return "editExam";
		}
		else {
			System.out.println("2");
			examdao.saveOrUpdate(exam);
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(value="/admin/addExam",method=RequestMethod.GET)
	public String addExam(Model model, Principal principal) {
		
		Exam exam=new Exam();
		model.addAttribute("exam",exam);
		List<Subject>subjects=subjectdao.getAll();
		Map< String, String > subjectTypes = new HashMap<String, String>();
		for(Subject subject1:subjects) {
			subjectTypes.put(subject1.getSubjectCode(), subject1.getSubjectCode());
		}
		model.addAttribute("subjectTypes", subjectTypes);
		return "addExam";
	}
	
	@RequestMapping(value="/admin/addExam",method=RequestMethod.POST)
	public String addExamProcess(@Valid @ModelAttribute("exam") Exam exam,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			List<Subject>subjects=subjectdao.getAll();
			Map< String, String > subjectTypes = new HashMap<String, String>();
			for(Subject subject1:subjects) {
				subjectTypes.put(subject1.getSubjectCode(), subject1.getSubjectCode());
			}
			model.addAttribute("subjectTypes", subjectTypes);
			return "addExam";
		}
		else {
			examdao.insertExam(exam);
			return "redirect:/admin";
		}
		
	}
	
}
