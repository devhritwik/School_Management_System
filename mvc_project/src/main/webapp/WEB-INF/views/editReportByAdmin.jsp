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
<title>Edit Report</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="report" action="/dbms/admin/editReport/${report.reportID}">
		
		<table>
		<caption>Edit Report</caption>
		<form:hidden path="reportID"/> <form:errors path="reportID"/>
		<tbody>
		<tr><td>date</td><td>
		<form:input path="date" type="date" value="${report.date}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>topic</td><td>
		<form:input path="topic" type="text" value="${report.topic}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="topic" /></td></tr>
		<!--
		<tr><td>message</td><td>
		<form:input path="message" type="text" /> </td> bind to user.name
		<td><form:errors path="message" /></td></tr>-->
		
		<tr><td>message</td><td>
		<textarea name="message" rows="10" cols="30">${report.message}</textarea></td><td></td>
		</tr>
		
		<tr><td>action</td><td>
		<form:input path="action" type="text" value="${report.action}"/> </td><!-- bind to user.name-->
		<td><form:errors path="action" /></td></tr>
		
		<tr><td>forStudent</td>
			<td><form:select path="forStudent" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${studentTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="forStudent" /></td>
		</tr>

		<tr><td>byTeacher</td>
			<td><form:select path="byTeacher" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${teacherTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="byTeacher" /></td>
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