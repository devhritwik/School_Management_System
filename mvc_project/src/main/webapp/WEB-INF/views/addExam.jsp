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
<title>Add Exam</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="exam" action="/dbms/admin/addExam">
		
		<table>
		<caption>Add Exam</caption>
		
		<tbody>
		<tr><td>date</td><td>
		<form:input path="date" type="date" value="${exam.date}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>type</td><td>
		<form:input path="type" type="text" value="${exam.type}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="type" /></td></tr>
		
		<tr><td>subjectCode</td>
			<td><form:select path="subjectCode" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${subjectTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="subjectCode" /></td>
		</tr>
		
		<!-- 
		<tr><td>time</td><td>
		<form:input path="time" type="time" value="${exam.time}"/> </td>
		<td><form:errors path="time" /></td></tr>
		 -->
		
		<tr><td>roomNo</td><td>
		<form:input path="roomNo" type="text" value="${exam.roomNo}" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="roomNo" /></td></tr>
		
		<tr><td>maxMarks</td><td>
		<form:input path="maxMarks" type="text" value="${exam.maxMarks}" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="maxMarks" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>