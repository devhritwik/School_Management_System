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
<title>Add Report</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarTeacher.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="report" action="/dbms/teacher/reportSection/addReport">
		
		<table>
		<caption>Add Report</caption>
		<form:hidden path="byTeacher"/> <form:errors path="byTeacher"/>
		<form:hidden path="reportID"/> <form:errors path="reportID"/>
		
		<tbody>
		<tr><td>
		date</td><td>
		<form:input path="date" type="date" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>
		topic</td><td>
		<form:input path="topic" type="text"  required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="topic" /></td></tr>
		
		<tr><td>message</td><td>
		<textarea name="message" rows="10" cols="30" >Enter text here!</textarea></td><td></td>
		</tr>
		
		<tr><td>
		action</td><td>
		<form:input path="action" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="action" /></td></tr>
		
		<tr><td>forStudent</td>
			<td><form:select path="forStudent" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${studentTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="forStudent" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>