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
<title>Exam Section</title>
</head>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbarTeacher.jsp" %>
		<div class="wrapper">
		
        <table>
	  <caption>Your subject's exams</caption>
	  <thead>
        <tr><th>date</th><th>type</th><th>subjectCode</th>
        <th>time</th><th>roomNo</th><th>maxMarks</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${exams}" var="listVar">
        <tr>
        	
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.type}"/></td>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<td><c:out value="${listVar.roomNo}"/></td>
        	<td><c:out value="${listVar.maxMarks}"/></td>
        	
        	<td><a href="/dbms/teacher/examSection/editMarks/${listVar.date}/${listVar.type}/${listVar.subjectCode}">Enter Marks</a></td>
        </tr>
        </c:forEach>
        </tbody>
        </table>
        </div>
    </c:if>
</body>
</html>
