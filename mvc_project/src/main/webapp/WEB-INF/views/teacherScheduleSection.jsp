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
<title>Schedule</title>
</head>
<html>
<body>
    
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbarTeacher.jsp" %>
        <div class="wrapper">
		<table>
		  <caption>Your teaching schedule</caption>
		  <thead>
		    <tr><th>day</th><th>period No</th><th>class ID</th><th>subject Code</th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${scheduleListByTeacher}" var="listVar">
	        <tr>
	        	<td><c:out value="${listVar.day}"/></td>
	        	<td><c:out value="${listVar.periodNo}"/></td>
	        	<td><c:out value="${listVar.classID}"/></td>
	        	<td><c:out value="${listVar.subjectCode}"/></td>
	        </tr>
	        </c:forEach>
		  </tbody>
		</table>
		</div>
    </c:if>
    
</body>
</html>
