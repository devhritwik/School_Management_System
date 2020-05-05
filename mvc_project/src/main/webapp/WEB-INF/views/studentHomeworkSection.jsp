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
<title>Homework Section</title>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbar.jsp" %>
        <div class="wrapper">
        <h5>You have got ${homeworkCountByStudent} homeworks.</h5>
        
		<table>
		  <caption>Your Homeworks</caption>
		  <thead>
		    <tr><th>homework ID</th><th>date</th><th>maxMarks</th><th>By Teacher</th><th>Status</th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${homeworkListByStudent}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.homeworkID}"/></td>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.maxMarks}"/></td>
	        	<td><c:out value="${listVar.byTeacher}"/></td>
	        	<td><c:out value="${listVar.status}"/></td>
	        	
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        </div>
    </c:if>
</body>
</html>
