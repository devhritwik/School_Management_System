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
        <%@include file="./shared/navbar.jsp" %>
        <div class="wrapper">
        <h5>You have got ${reportCountByStudent} reports!</h5>
        
		<table>
		  <caption>Your Reports</caption>
		  <thead>
		    <tr>
		    	<th>Report ID</th><th>date</th><th>topic</th>
		        <th>message</th><th>action</th><th>By Teacher</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${reportListByStudent}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.reportID}"/></td>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.topic}"/></td>
	        	<td><c:out value="${listVar.message}"/></td>
	        	<td><c:out value="${listVar.action}"/></td>
	        	<td><c:out value="${listVar.byTeacher}"/></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        </div>
    </c:if>
</body>
</html>
