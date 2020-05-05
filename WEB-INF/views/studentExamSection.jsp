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
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbar.jsp" %>
        <div class="wrapper">
        <h5>You have got ${examCountByStudent} exams.</h5>
        
		<table>
		  <caption>Your Exams</caption>
		  <thead>
		    <tr><th>Date</th><th>Type</th><th>subjectCode</th>
        	<th>roomNo</th><th>maxMarks</th><th></th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${examListByStudent}" var="listVar">
	        <tr>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.type}"/></td>
	        	<td><c:out value="${listVar.subjectCode}"/></td>
	        	<td><c:out value="${listVar.roomNo}"/></td>
	        	<td><c:out value="${listVar.maxMarks}"/></td>
	        	<td><a href="/dbms/student/examSection/viewMarks/${listVar.date}/${listVar.type}/${listVar.subjectCode}">View Marks</a></td>
	        </tr>
	        </c:forEach>
		  </tbody>
		</table>
        </div>
    </c:if>
</body>
</html>
