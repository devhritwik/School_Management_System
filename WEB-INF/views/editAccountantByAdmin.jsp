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
<title>Edit Accountant Profile</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	
	<form:form method="post" modelAttribute="accountant" action="/dbms/admin/editAccountant/${accountant.accountantID}">
		
		<table>
		<caption>Edit Accountant Profile</caption>
		<form:hidden path="accountantID"/> <form:errors path="accountantID"/>
		<form:hidden path="middleName"/> <form:errors path="middleName"/>
		<form:hidden path="lastName"/> <form:errors path="lastName"/>
		<form:hidden path="gender"/> <form:errors path="gender"/>
		<form:hidden path="mobNo"/> <form:errors path="mobNo"/>
		<form:hidden path="aadharNo"/> <form:errors path="aadharNo"/>
		
		<tbody>
		
		<tr><td>First Name</td><td>
		<form:input path="firstName" type="text" value="${accountant.firstName}" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="firstName" /></td></tr>
		
		<tr><td>Email ID</td>
		<td>
		<form:input path="email" type="text" value="${accountant.email}" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>
		
		<tr><td>Work Type</td>
		<td>
		<form:input path="workType" type="text" value="${accountant.workType}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="workType" /></td></tr>
		
		<tr><td>Salary</td>
		<td>
		<form:input path="salary" type="text" value="${accountant.salary}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="salary" /></td></tr>
		
		<tr><td>Join Date</td>
		<td>
		<form:input path="joinDate" type="date" value="${accountant.joinDate}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="joinDate" /></td></tr>
		
		<tr><td>Resign Date</td>
		<td>
		<form:input path="resignDate" type="date" value="${accountant.resignDate}"/> </td><!-- bind to user.name-->
		<td><form:errors path="resignDate" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>