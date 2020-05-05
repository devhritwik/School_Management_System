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
<title>Edit Schedule</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="schedule" action="/dbms/admin/editScheduleResult">
		
		<table>
		<caption>Edit Schedule</caption>
		
		<tbody>
		<tr><td>day</td><td>
		<form:input path="day" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="day" /></td></tr>
		
		<tr><td>periodNo</td><td>
		<form:input path="periodNo" type="number" min="0" max="8"/> </td><!-- bind to user.name-->
		<td><form:errors path="periodNo" /></td></tr>
		
		<tr><td>classID</td><td>
		<form:input path="classID" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="classID" /></td></tr>
		
		<tr><td>teacherID</td><td>
		<form:input path="teacherID" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="teacherID" /></td></tr>
		
		<tr><td>subjectCode</td><td>
		<form:input path="subjectCode" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="subjectCode" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>