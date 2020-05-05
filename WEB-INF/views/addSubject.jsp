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
<title>Add Subject</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbarAdmin.jsp" %>
	<form:form method="post" modelAttribute="subject" action="/dbms/admin/addSubject">
		
		<table>
		<caption>Add Subject</caption>
		<tbody>
		<tr><td>Subject Code</td><td>
		<form:input path="subjectCode" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="subjectCode" /></td></tr>
		
		<tr><td>Subject Name</td><td>
		<form:input path="subjectName" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="subjectName" /></td></tr>
		
		<tr><td>forClass</td>
			<td><form:select path="forClass" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${classTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="forClass" /></td>
		</tr>
		
		<tr><td>gradedOrNot</td>
			<td><form:select path="gradedOrNot" required="required">
				  <form:option value="No" label="--- Select ---" />
				  <form:options items="${choicesTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="gradedOrNot" /></td>
		</tr>
		
		<tr><td>book Name</td><td>
		<form:input path="bookName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="bookName" /></td></tr>
		
		<tr><td>bookPublication</td><td>
		<form:input path="bookPublication" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="bookPublication" /></td></tr>
		
		<tr><td>bookPrice</td><td>
		<form:input path="bookPrice" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="bookPrice" /></td></tr>
		
		<tr><td>notebookType</td><td>
		<form:input path="notebookType" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="notebookType" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
</c:if>