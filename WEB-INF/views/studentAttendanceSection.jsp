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
        <%@include file="./shared/navbar.jsp" %>
        <div class="wrapper">
		<table>
		  <caption>Your Attendance</caption>
		  <thead>
		    <tr><th>date</th><th>periodNo</th><th>status</th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${attendanceListByStudent}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.periodNo}"/></td>
	        	<td><c:out value="${listVar.status}"/></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        </div>
    </c:if>
</body>
</html>
