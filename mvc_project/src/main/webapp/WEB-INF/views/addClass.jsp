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
<title>Add Class</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="class1" action="/dbms/admin/addClass">
		
		<table>
		<caption>Add Class</caption>
		
		<tbody>
		<tr><td>class id</td><td>
		<form:input path="classID" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="classID" /></td></tr>
		
		<tr><td>className</td><td>
		<form:input path="className" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="className" /></td></tr>
		
		<tr><td>roomNo</td><td>
		<form:input path="roomNo" type="text" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="roomNo" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>