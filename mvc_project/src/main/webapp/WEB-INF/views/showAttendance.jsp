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
<title>Show Attendance</title>
</head>

<html>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	
		<%@include file="./shared/navbarTeacher.jsp" %>
		<div class="wrapper">
		
        date: ${currentDate}
        
        <table>
			  <caption>Attendance</caption>
			<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">Date</th>
				<th scope="col">periodNo</th>
				<th scope="col">studentID</th>
				<th scope="col">status</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${attendanceList.attendances}" var="attendance" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${attendance.date}</td>
					<td>${attendance.periodNo}</td>
					<td>${attendance.studentID}</td>
					<td>${attendance.status}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	
</c:if>