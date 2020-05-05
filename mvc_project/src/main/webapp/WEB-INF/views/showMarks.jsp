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
<title>Marks</title>
</head>

<html>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
		
		<%@include file="./shared/navbarTeacher.jsp" %>
		<div class="wrapper">
		<table>
			  <caption>Marks</caption>
			<thead>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>type</th>
				<th>subject Code</th>
				<th>student ID</th>
				<th>marks Obtained</th>
			</tr>
			</thead>
			<c:forEach items="${marksList.marks}" var="marks" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${marks.date}</td>
					<td>${marks.type}</td>
					<td>${marks.subjectCode}</td>
					<td>${marks.studentID}</td>
					<td>${marks.marksObtained}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>	
		</div>
</c:if>