<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url var="style" value="/style" />

<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Edit Profile</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">

	<%@include file="./shared/navbarParent.jsp" %>
	<div class="wrapper">
	
	<form:form method="post" modelAttribute="parent" action="/dbms/parent/editProfile">
	

		<table>
		<caption>Edit Profile</caption>
		<form:hidden path="parentID"/> <form:errors path="parentID"/>
		<tbody>
		
		<tr><td>
		Parent ID</td><td>
		${parent.parentID}</td><td></td></tr>
		
		<tr><td>
		Father's First Name</td><td>
		<form:input path="fatherFirstName" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherFirstName" /></td></tr>
		
		<tr><td>
		Father's Middle Name</td><td>
		<form:input path="fatherMiddleName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherMiddleName" /></td></tr>
		
		<tr><td>
		Father's Last Name</td><td>
		<form:input path="fatherLastName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherLastName" /></td></tr>
		
		<tr><td>
		Mother's First Name</td><td>
		<form:input path="motherFirstName" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherFirstName" /></td></tr>
		
		<tr><td>Mother's Middle Name</td>
		<td><form:input path="motherMiddleName" type="text" /></td>
		<td><form:errors path="motherMiddleName"/></td></tr>
		
		<tr><td>Mother's Last Name</td>
		<td>
		<form:input path="motherLastName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherLastName" /></td></tr>
		
		<tr><td>Father's Mobile No</td>
		<td>
		<form:input path="fatherMobNo" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherMobNo" /></td></tr>
		
		<tr><td>Mother's Mobile No</td>
		<td>
		<form:input path="motherMobNo" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherMobNo" /></td></tr>
		
		<tr><td>Father's Email ID</td>
		<td>
		<form:input path="fatherEmail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherEmail" /></td></tr>
		
		<tr><td>Mother's Email ID</td>
		<td>
		<form:input path="motherEmail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherEmail" /></td></tr>
		
		<tr><td>Father's Profession</td>
		<td>
		<form:input path="fatherProfession" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherProfession" /></td></tr>
		
		<tr><td>Mother's Profession</td>
		<td>
		<form:input path="motherProfession" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherProfession" /></td></tr>
		
		<tr><td>Father's Salary</td>
		<td>
		<form:input path="fatherSalary" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherSalary" /></td></tr>
		
		<tr><td>Mother's Salary</td>
		<td>
		<form:input path="motherSalary" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherSalary" /></td></tr>
		
		<tr><td>Father's Aadhar No</td>
		<td>
		<form:input path="fatherAadharNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherAadharNo" /></td></tr>
		
		<tr><td>Mother's Aadhar No</td>
		<td>
		<form:input path="motherAadharNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherAadharNo" /></td></tr>
		
		<tr><td>Father's Qualification</td>
		<td>
		<form:input path="fatherQualification" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherQualification" /></td></tr>
		
		<tr><td>Mother's Qualification</td>
		<td>
		<form:input path="motherQualification" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherQualification" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>