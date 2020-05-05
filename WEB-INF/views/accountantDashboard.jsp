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
<title>${topic}</title>
<style>
ul {
  list-style: none;
}
td:first-child {
font-weight: bold;
}
</style>
</head>
<html>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
        	<%@include file="./shared/navbarAccountant.jsp" %>
        	<div class="wrapper">
			<table>
			  <caption>${topic}</caption>
			<tbody>
        	
        	<tr>
	        	<td>Accountant ID</td>
	        	<td>${accountant.accountantID}</td>
        	</tr>
        	<tr>
	        	<td>First Name</td>
	        	<td>${accountant.firstName}</td>
        	</tr>
        	<tr>
	        	<td>Middle Name</td>
	        	<td>${accountant.middleName}</td>
        	</tr>
        	<tr>
	        	<td>Last Name</td>
	        	<td>${accountant.lastName}</td>
        	</tr>
        	<tr>
	        	<td>gender</td>
	        	<td>${accountant.gender}</td>
        	</tr>
        	<tr>
	        	<td>Mobile No</td>
	        	<td>${accountant.mobNo}</td>
        	</tr>
        	<tr>
	        	<td>Email ID</td>
	        	<td>${accountant.email}</td>
        	</tr>
        	<tr>
	        	<td>Work Type</td>
	        	<td>${accountant.workType}</td>
        	</tr>
        	<tr>
	        	<td>Salary</td>
	        	<td>${accountant.salary}</td>
        	</tr>
        	<tr>
	        	<td>Join Date</td>
	        	<td>${accountant.joinDate}</td>
        	</tr>
        	<tr>
	        	<td>Resign Date</td>
	        	<td>${accountant.resignDate}</td>
        	</tr>
        	
        	</tbody>
		</table>
		</div>
        </c:if>
</body>
</html>

