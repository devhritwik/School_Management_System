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
import com.dbms.dao.Billdao;

import com.dbms.model.Student;
import com.dbms.model.Teacher;
import com.dbms.model.Parent;
import com.dbms.model.Accountant;
import com.dbms.model.Bill;
import com.dbms.model.User;
import com.dbms.model.Class;
import com.dbms.model.Subject;
import com.dbms.model.Report;

@Controller
public class ParentController {

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
	public Billdao billdao;
	
	
	@RequestMapping(value = "/parent/dashboard")
	public String welcome(Model model, Principal principal) {
		
		/*if(principal != null)
		{*/
			Parent parent=parentdao.getParent(principal.getName());
			model.addAttribute("parent",parent);
			model.addAttribute("topic","DASHBOARD");
			//System.out.println(principal.getName());
			return "parentDashboard";
		
		//return null;
	}
	
	@RequestMapping(value="/profile/p/{id}",method = RequestMethod.GET)  
	public String parentProfile(Model model, @PathVariable String id) {
		Parent parent=parentdao.getParent(id);
		model.addAttribute("parent",parent);
		model.addAttribute("topic",id+"'s Profile");
		return "parentDashboardByAdmin";
	}

	@RequestMapping(value="/parent/editProfile",method=RequestMethod.GET)
	public String editProfile(Model model, Principal principal) {

		Parent parent=parentdao.getParent(principal.getName());
//		System.out.println(parent.getParentID());
		model.addAttribute("parent",parent);

		return "editParentProfile";
	}
	
	@RequestMapping(value="/parent/editProfile",method=RequestMethod.POST)
	public String editProfileProcess(@Valid @ModelAttribute("parent") Parent parent,BindingResult result,Model model) {
		if(result.hasErrors()) {
			return "editParentProfile";
		}
		else {
			parentdao.saveOrUpdate(parent);
			return "redirect:/parent/dashboard";
		}
		
	}
	
	@RequestMapping(value = "/parent/reportSection")
	public String reportSection(Model model, Principal principal) {
			Parent parent=parentdao.getParent(principal.getName());
			List<Report> reportListByParent=reportdao.getReportsByParent(parent.getParentID());
			model.addAttribute("parent",parent);
			model.addAttribute("reportListByParent",reportListByParent);
			model.addAttribute("reportCountByParent",reportdao.getReportCountByParent(parent.getParentID()));
			return "parentReportSection";
	}
	
	@RequestMapping(value = "/parent/billSection")
	  public String billSection(Model model, Principal principal) {
	      Parent parent=parentdao.getParent(principal.getName());
	      List<Bill> billListByParent=billdao.getBillsByParent(parent.getParentID());
	      model.addAttribute("parent",parent);
	      model.addAttribute("billListByParent",billListByParent);
	      model.addAttribute("billCountByParent",billdao.getBillCountByParent(parent.getParentID()));
	      return "parentBillSection";
	}
	
	@RequestMapping(value="/parent/billSection/invoice/{id}",method = RequestMethod.GET)  
    String getInvoice(Model model,@PathVariable String id){
		Bill bill=billdao.getBill(id);
		model.addAttribute("bill",bill);
		Student student=studentdao.getStudent(bill.getOfStudent());
		model.addAttribute("student",student);
		Class class1=classdao.getClass(student.getClassID());
		model.addAttribute("class1",class1);
		Parent parent=parentdao.getParent(student.getParentID());
		model.addAttribute("parent",parent);
		Accountant accountant=accountantdao.getAccountant(bill.getThroughAccountant());
		model.addAttribute("accountant",accountant);
		
		
		return "invoice";
    }
	
}
