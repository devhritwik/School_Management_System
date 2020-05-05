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
<title>View Marks</title>
</head>
<html>
<body>

<c:if test="${pageContext.request.userPrincipal.name != null}">
		<%@include file="./shared/navbar.jsp" %>
		<div class="wrapper">
		<table>
		  <caption>Marks of ${date} | ${type} | ${subjectCode}</caption>
		  <thead>
		    <tr>
				<th>studentID</th>
				<th>marksObtained</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${marksList}" var="marks">
				<tr>
					<td>${marks.studentID}</td>
					<td>${marks.marksObtained}</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
		</div>
</c:if>