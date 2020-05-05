<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page session="true"%>
<spring:url var="style" value="/style" />
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Edit Marks</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
		
		<%@include file="./shared/navbarTeacher.jsp" %>
        <div class="wrapper">
        <form:form method="post" action="/dbms/teacher/examSection/editMarksResult" modelAttribute="marksList">
			<table>
			<caption>Edit Marks</caption>
		    <thead>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>type</th>
				<th>subjectCode</th>
				<th>studentID</th>
				<th>marksObtained</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${marksList.marks}" var="marks" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><input name="marks[${status.index}].date" value="${marks.date}" type="date" readonly /></td>
					<td><input name="marks[${status.index}].type" value="${marks.type}" type="text" readonly /></td>
					<td><input name="marks[${status.index}].subjectCode" value="${marks.subjectCode}" type="text" readonly /></td>
					<td><input name="marks[${status.index}].studentID" value="${marks.studentID}" type="text" readonly /></td>
					<td><input name="marks[${status.index}].marksObtained" value="${marks.marksObtained}" type="text" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br/>
		<input type="submit" value="Save" />
		
		</form:form>
		</div>
	
</c:if>