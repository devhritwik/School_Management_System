package com.dbms;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class AccountantController {

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
	
	@RequestMapping(value = "/accountant/dashboard")
	public String welcome(Model model, Principal principal) {
		
		/*if(principal != null)
		{*/
			Accountant accountant=accountantdao.getAccountant(principal.getName());
			model.addAttribute("accountant",accountant);
			model.addAttribute("topic","DASHBOARD");
			//System.out.println(principal.getName());
			return "accountantDashboard";
		
		//return null;
	}
	
	@RequestMapping(value="/profile/a/{id}")  
	public String accountantProfile(Model model, @PathVariable String id) {
		Accountant accountant=accountantdao.getAccountant(id);
		model.addAttribute("accountant",accountant);
		model.addAttribute("topic",id+"'s Profile");
		return "accountantDashboardByAdmin";
	}

	@RequestMapping(value="/accountant/editProfile",method=RequestMethod.GET)
	public String editProfile(Model model, Principal principal) {

		Accountant accountant=accountantdao.getAccountant(principal.getName());
//		System.out.println(accountant.getAccountantID());
		model.addAttribute("accountant",accountant);
		Map< String, String > genderTypes = new HashMap<String, String>();
		genderTypes.put("Male", "Male");
		genderTypes.put("Female", "Female");
		genderTypes.put("Other", "Other");
        model.addAttribute("genderTypes", genderTypes);

		return "editAccountantProfile";
	}
	
	@RequestMapping(value="/accountant/editProfile",method=RequestMethod.POST)
	public String editProfileProcess(@Valid @ModelAttribute("accountant") Accountant accountant,BindingResult result,Model model) {
		if(result.hasErrors()) {
			Map< String, String > genderTypes = new HashMap<String, String>();
			genderTypes.put("Male", "Male");
			genderTypes.put("Female", "Female");
			genderTypes.put("Other", "Other");
	        model.addAttribute("genderTypes", genderTypes);
			return "editAccountantProfile";
		}
		else {
			accountantdao.saveOrUpdate(accountant);
			return "redirect:/accountant/dashboard";
		}
		
	}
	
	@RequestMapping(value = "/accountant/billSection")
	public String billSection(Model model, Principal principal) {
			Accountant accountant=accountantdao.getAccountant(principal.getName());
			List<Bill> billListByAccountant=billdao.getBillsByAccountant(accountant.getAccountantID());
			model.addAttribute("accountant",accountant);
			model.addAttribute("billListByAccountant",billListByAccountant);
			model.addAttribute("billCountByAccountant",billdao.getBillCountByAccountant(accountant.getAccountantID()));
			return "accountantBillSection";
	}
	
	@RequestMapping(value="/accountant/billSection/deleteBill/{id}",method = RequestMethod.GET)  
    public ModelAndView deleteBill(@PathVariable String id){  
		billdao.delete(id);  
        return new ModelAndView("redirect:/accountant/billSection");  
    }
	
	@RequestMapping(value="/accountant/billSection/editBill/{id}",method=RequestMethod.GET)
	public String editBill(Model model, @PathVariable String id) {

		Bill bill=billdao.getBill(id);
		model.addAttribute("bill",bill);
		Map< String, String > statusTypes = new HashMap<String, String>();
		statusTypes.put("Paid", "Paid");
		statusTypes.put("Not Paid", "Not Paid");
        model.addAttribute("statusTypes", statusTypes);
        Map< String, String > feePeriodTypes = new HashMap<String, String>();
        feePeriodTypes.put("Monthly", "Monthly");
		feePeriodTypes.put("Quaterly", "Quaterly");
		feePeriodTypes.put("Half yearly", "Half yearly");
		feePeriodTypes.put("Yearly", "Yearly");
        model.addAttribute("feePeriodTypes", feePeriodTypes);
        List<Student>students=studentdao.getAll();
		Map< String, String > studentTypes = new HashMap<String, String>();
		for(Student student1:students) {
			studentTypes.put(student1.getStudentID(), student1.getStudentID());
		}
		model.addAttribute("studentTypes", studentTypes);
        
		return "editBill";
	}
	
	@RequestMapping(value="/accountant/billSection/editBill/{id}",method=RequestMethod.POST)
	public String editBillProcess(@Valid @ModelAttribute("bill") Bill bill,BindingResult result,Model model, @PathVariable String id) {
		if(result.hasErrors()) {
			Map< String, String > statusTypes = new HashMap<String, String>();
			statusTypes.put("Paid", "Paid");
			statusTypes.put("Not Paid", "Not Paid");
	        model.addAttribute("statusTypes", statusTypes);
	        Map< String, String > feePeriodTypes = new HashMap<String, String>();
	        feePeriodTypes.put("Monthly", "Monthly");
			feePeriodTypes.put("Quaterly", "Quaterly");
			feePeriodTypes.put("Half yearly", "Half yearly");
			feePeriodTypes.put("Yearly", "Yearly");
	        model.addAttribute("feePeriodTypes", feePeriodTypes);
	        List<Student>students=studentdao.getAll();
			Map< String, String > studentTypes = new HashMap<String, String>();
			for(Student student1:students) {
				studentTypes.put(student1.getStudentID(), student1.getStudentID());
			}
			model.addAttribute("studentTypes", studentTypes);
			return "editBill";
		}
		else {
			System.out.println("2");
			billdao.saveOrUpdate(bill);
			return "redirect:/accountant/billSection";
		}
		
	}
	
	@RequestMapping(value="/accountant/billSection/addBill",method=RequestMethod.GET)
	public String addBill(Model model, Principal principal) {
		
		Bill bill=new Bill();
		model.addAttribute("bill",bill);
		Map< String, String > statusTypes = new HashMap<String, String>();
		statusTypes.put("Paid", "Paid");
		statusTypes.put("Not Paid", "Not Paid");
        model.addAttribute("statusTypes", statusTypes);
        Map< String, String > feePeriodTypes = new HashMap<String, String>();
        feePeriodTypes.put("Monthly", "Monthly");
		feePeriodTypes.put("Quaterly", "Quaterly");
		feePeriodTypes.put("Half yearly", "Half yearly");
		feePeriodTypes.put("Yearly", "Yearly");
        model.addAttribute("feePeriodTypes", feePeriodTypes);
        List<Student>students=studentdao.getAll();
		Map< String, String > studentTypes = new HashMap<String, String>();
		for(Student student1:students) {
			studentTypes.put(student1.getStudentID(), student1.getStudentID());
		}
		model.addAttribute("studentTypes", studentTypes);
		return "addBill";
	}
	
	@RequestMapping(value="/accountant/billSection/addBill",method=RequestMethod.POST)
	public String addBillProcess(@Valid @ModelAttribute("bill") Bill bill,BindingResult result,Model model, Principal principal) {
		if(result.hasErrors()) {
			Map< String, String > statusTypes = new HashMap<String, String>();
			statusTypes.put("Paid", "Paid");
			statusTypes.put("Not Paid", "Not Paid");
	        model.addAttribute("statusTypes", statusTypes);
	        Map< String, String > feePeriodTypes = new HashMap<String, String>();
	        feePeriodTypes.put("Monthly", "Monthly");
			feePeriodTypes.put("Quaterly", "Quaterly");
			feePeriodTypes.put("Half yearly", "Half yearly");
			feePeriodTypes.put("Yearly", "Yearly");
	        model.addAttribute("feePeriodTypes", feePeriodTypes);
	        List<Student>students=studentdao.getAll();
			Map< String, String > studentTypes = new HashMap<String, String>();
			for(Student student1:students) {
				studentTypes.put(student1.getStudentID(), student1.getStudentID());
			}
			model.addAttribute("studentTypes", studentTypes);
			return "addBill";
		}
		else {
			billdao.insertBill(bill, principal.getName());
			return "redirect:/accountant/billSection";
		}
		
	}
	
}
