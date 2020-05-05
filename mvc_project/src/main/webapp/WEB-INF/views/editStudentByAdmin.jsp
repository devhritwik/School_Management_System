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
<title>Edit Student Profile</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="student" action="/dbms/admin/editStudent/${student.studentID}">
		
		<table>
		<caption>Edit Student Profile</caption>
		<form:hidden path="studentID"/> <form:errors path="studentID"/>
		<form:hidden path="middleName"/> <form:errors path="studentID"/>
		<form:hidden path="lastName"/> <form:errors path="firstName"/>
		<form:hidden path="gender"/> <form:errors path="studentID"/>
		<form:hidden path="DOB"/>	<form:errors path="email"/>
		<form:hidden path="mobNo"/> <form:errors path="firstName"/>
		<form:hidden path="houseNo"/> <form:errors path="studentID"/>
		<form:hidden path="street"/>	<form:errors path="email"/>
		<form:hidden path="locality"/> <form:errors path="firstName"/>
		<form:hidden path="city"/> <form:errors path="studentID"/>
		<form:hidden path="state"/> <form:errors path="firstName"/>
		<form:hidden path="pincode"/> <form:errors path="studentID"/>
		<form:hidden path="bloodGp"/>	<form:errors path="email"/>
		<form:hidden path="aadharNo"/> <form:errors path="firstName"/>
		<form:hidden path="category"/> <form:errors path="studentID"/>
		
		<tbody>
		
		<tr><td>First Name</td>
		<td>
		<form:input path="firstName" type="text" value="${student.firstName}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="firstName" /></td></tr>
		
		<tr><td>Email ID</td>
		<td>
		<form:input path="email" type="text" value="${student.email}" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>
		
		<tr><td>Parent ID</td>
			<td><form:select path="parentID" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${parentTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="parentID" /></td>
		</tr>
		
		<tr><td>Class ID</td>
			<td><form:select path="classID" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${classTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="classID" /></td>
		</tr>
		
		<tr><td>Admission Year</td>
		<td>
		<form:input path="admissionYear" type="text" value="${student.admissionYear}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="admissionYear" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>