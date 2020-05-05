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
<title>Mark Attendance</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	
		<%@include file="./shared/navbarTeacher.jsp" %>
		<div class="wrapper">
        <form:form method="post" action="/dbms/teacher/attendanceSection/markAttendanceResult" modelAttribute="attendanceList">
			<table>
			<caption>Mark Attendance</caption>
		    <thead>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>periodNo</th>
				<th>studentID</th>
				<th>status</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${attendanceList.attendances}" var="attendance" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><input name="attendances[${status.index}].date" value="${attendance.date}" type="date" readonly /></td>
					<td><input name="attendances[${status.index}].periodNo" value="${attendance.periodNo}" type="text" readonly /></td>
					<td><input name="attendances[${status.index}].studentID" value="${attendance.studentID}" type="text" readonly /></td>
					<td><form:select path="attendances[${status.index}].status" required="required" >
						  <form:option value="" label="--- Select ---" />
						  <form:options items="${attendanceTypes}" />
					    </form:select>
		            </td>
					
					
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br/>
		
		<input type="submit" value="Save" />
		
		
		</form:form>
	</div>
</c:if>