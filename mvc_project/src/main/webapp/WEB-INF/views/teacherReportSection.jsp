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
<title>Reports</title>
</head>

<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbarTeacher.jsp" %>
		<div class="wrapper">
        <h5>You have submitted ${reportCountByTeacher} reports.</h5>
        
		<table>
		  <caption>Your Reports</caption>
		  <thead>
		    <tr><th>Report ID</th><th>date</th><th>topic</th>
        <th>message</th><th>action</th><th>For Student</th><th></th><th></th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${reportListByTeacher}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.reportID}"/></td>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.topic}"/></td>
	        	<td><c:out value="${listVar.message}"/></td>
	        	<td><c:out value="${listVar.action}"/></td>
	        	<td><c:out value="${listVar.forStudent}"/></td>
	        	<td><a href="/dbms/teacher/reportSection/editReport/${listVar.reportID}">Edit</a></td>
	        	<td><a href="/dbms/teacher/reportSection/deleteReport/${listVar.reportID}">Delete</a></td>
	        	
		    </tr>
		    </c:forEach>
		    <tr>
        <td><a href="/dbms/teacher/reportSection/addReport"><button type="button">Add a report</button></a></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        </tr>
		  </tbody>
		</table>
		</div>
    </c:if>
</body>
</html>
