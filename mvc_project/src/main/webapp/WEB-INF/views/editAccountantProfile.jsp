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

	<%@include file="./shared/navbarAccountant.jsp" %>
	<div class="wrapper">
	
	<form:form method="post" modelAttribute="accountant" action="/dbms/accountant/editProfile">
		
		<table>
		<caption>Edit Profile</caption>
		<form:hidden path="accountantID"/> <form:errors path="accountantID"/>
		<form:hidden path="email"/>	<form:errors path="email"/>
		<form:hidden path="firstName"/> <form:errors path="firstName"/>
		<tbody>
		
		<tr><td>
		Accountant ID</td><td>
		${accountant.accountantID}</td><td></td></tr>
		
		<tr><td>
		First Name</td><td>
		${accountant.firstName}</td><td></td></tr>
		
		<tr><td>
		Middle Name</td><td>
		<form:input path="middleName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="middleName" /></td></tr>
		
		<tr><td>
		Last Name</td><td>
		<form:input path="lastName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="lastName" /></td></tr>
		
		<tr><td>Gender</td>
			<td><form:select path="gender" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${genderTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="gender" /></td>
		</tr>
		
		<tr><td>Mobile No</td>
		<td>
		<form:input path="mobNo" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="mobNo" /></td></tr>
		
		<tr><td>
		Email ID</td><td>
		${accountant.email}</td><td></td></tr>
		
		<tr><td>
		Work Type</td><td>
		${accountant.workType}</td><td></td></tr>
		
		<tr><td>
		Salary</td><td>
		${accountant.salary}</td><td></td></tr>
		
		<tr><td>
		Join Date</td><td>
		${accountant.joinDate}</td><td></td></tr>
		
		<tr><td>
		Resign Date</td><td>
		${accountant.resignDate}</td><td></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>