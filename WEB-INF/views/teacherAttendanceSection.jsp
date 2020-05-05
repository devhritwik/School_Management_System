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
<title>Attendance</title>
</head>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbarTeacher.jsp" %>
        <div class="wrapper">
        <h5>
        Day: ${day}
        <br/>
        Date: ${currentDate}
        </h5>
        
        <table>
		  <caption>Your today's schedule</caption>
		  <thead>
		  <tr><th>period No</th><th>class ID</th><th>subject Code</th><th></th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${scheduleListByDay}" var="listVar">
	        <tr>
	        	<td><c:out value="${listVar.periodNo}"/></td>
	        	<td><c:out value="${listVar.classID}"/></td>
	        	<td><c:out value="${listVar.subjectCode}"/></td>
	        	<td><a href="/dbms/teacher/attendanceSection/markAttendance/${listVar.periodNo}/${listVar.subjectCode}/">Take Attendance</a></td>
	        </tr>
	        </c:forEach>
		  </tbody>
		</table>
		</div>
    </c:if>
</body>
</html>
