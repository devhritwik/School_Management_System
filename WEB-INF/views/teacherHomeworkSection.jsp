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
<title>Homeworks</title>
</head>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
    
    	<%@include file="./shared/navbarTeacher.jsp" %>
    	<div class="wrapper">
        
        <p>You have given ${homeworkCountByTeacher} homework(s).</p>
        
        <table>
		  <caption>Your Homeworks</caption>
		  <thead>
		    <tr><th>homework ID</th><th>date</th><th>max Marks</th><th>subject Code</th><th></th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${homeworkListByTeacher}" var="listVar">
		    <tr>
	      		<!-- <td><a href="/dbms/teacher/homeworkSection/${listVar.homeworkID}"><c:out value="${listVar.homeworkID}"/></a></td> -->
	      		<td><c:out value="${listVar.homeworkID}"/></td>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.maxMarks}"/></td>
	        	<td><c:out value="${listVar.subjectCode}"/></td>
	        	<td><a href="/dbms/teacher/homeworkSection/editStatus/${listVar.homeworkID}">Send status</a></td>
	        	<!-- <td><a href="/dbms/teacher/homeworkSection/${listVar.homeworkID}/send">Send to students</a></td> -->
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
		<br/>
		<a href="/dbms/teacher/homeworkSection/addHomework"><button type="button">Add Homework</button></a>
		</div>
    </c:if>
</body>
</html>
