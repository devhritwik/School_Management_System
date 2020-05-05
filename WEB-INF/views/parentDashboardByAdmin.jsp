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
        	<%@include file="./shared/navbarAdmin.jsp" %>
        	<div class="wrapper">
			<table>
			  <caption>${topic}</caption>
			<tbody>
        	
        	<tr>
	        	<td>Parent ID</td>
	        	<td>${parent.parentID}</td>
        	</tr>
        	<tr>
	        	<td>Father's Name</td>
	        	<td>${parent.fatherFirstName} ${parent.fatherMiddleName} ${parent.fatherLastName}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Name</td>
	        	<td>${parent.motherFirstName} ${parent.motherMiddleName} ${parent.motherLastName}</td>
        	</tr>
			<tr>
	        	<td>Father's Mobile No</td>
	        	<td>${parent.fatherMobNo}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Mobile No</td>
	        	<td>${parent.motherMobNo}</td>
        	</tr>
        	<tr>
	        	<td>Father's Email ID</td>
	        	<td>${parent.fatherEmail}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Email ID</td>
	        	<td>${parent.motherEmail}</td>
        	</tr>
        	<tr>
	        	<td>Father's Profession</td>
	        	<td>${parent.fatherProfession}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Profession</td>
	        	<td>${parent.motherProfession}</td>
        	</tr>
        	<tr>
	        	<td>Father's Salary</td>
	        	<td>${parent.fatherSalary}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Salary</td>
	        	<td>${parent.motherSalary}</td>
        	</tr>
        	<tr>
	        	<td>Father's Aadhar No</td>
	        	<td>${parent.fatherAadharNo}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Aadhar No</td>
	        	<td>${parent.motherAadharNo}</td>
        	</tr>
        	<tr>
	        	<td>Father's Qualification</td>
	        	<td>${parent.fatherQualification}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Qualification</td>
	        	<td>${parent.motherQualification}</td>
        	</tr>

		  </tbody>
		</table>
        </div>
        </c:if>
</body>
</html>
