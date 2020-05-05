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
	        	<td>Student ID</td>
	        	<td>${student.studentID}</td>
        	</tr>
        	<tr>
	        	<td>First Name</td>
	        	<td>${student.firstName}</td>
        	</tr>
        	<tr>
	        	<td>Middle Name</td>
	        	<td>${student.middleName}</td>
        	</tr>
        	<tr>
	        	<td>Last Name</td>
	        	<td>${student.lastName}</td>
        	</tr>
        	<tr>
	        	<td>gender</td>
	        	<td>${student.gender}</td>
        	</tr>
        	<tr>
	        	<td>DOB</td>
	        	<td>${student.DOB}</td>
        	</tr>
        	<tr>
	        	<td>Mobile No</td>
	        	<td>${student.mobNo}</td>
        	</tr>
        	<tr>
	        	<td>Email ID</td>
	        	<td>${student.email}</td>
        	</tr>
        	<tr>
	        	<td>House No</td>
	        	<td>${student.houseNo}</td>
        	</tr>
        	<tr>
	        	<td>Street</td>
	        	<td>${student.street}</td>
        	</tr>
        	<tr>
	        	<td>Locality</td>
	        	<td>${student.locality}</td>
        	</tr>
        	<tr>
	        	<td>City</td>
	        	<td>${student.city}</td>
        	</tr>
        	<tr>
	        	<td>State</td>
	        	<td>${student.state}</td>
        	</tr>
        	<tr>
	        	<td>Pin Code</td>
	        	<td>${student.pincode}</td>
        	</tr>
        	<tr>
	        	<td>Parent ID</td>
	        	<td>${student.parentID}</td>
        	</tr>
        	<tr>
	        	<td>Class ID</td>
	        	<td>${student.classID}</td>
        	</tr>
        	<tr>
	        	<td>Blood Group</td>
	        	<td>${student.bloodGp}</td>
        	</tr>
        	<tr>
	        	<td>Admission Year</td>
	        	<td>${student.admissionYear}</td>
        	</tr>
        	<tr>
	        	<td>Aadhar No</td>
	        	<td>${student.aadharNo}</td>
        	</tr>
        	<tr>
	        	<td>Category</td>
	        	<td>${student.category}</td>
        	</tr>
        	<tr>
	        	<td>Hobbies</td>
	        	<td>
	        	<ul>
	        	<c:forEach items="${hobbies}" var="listVar">
	        	<li><c:out value="${listVar.hobby}"/></li>
				</c:forEach>
	        	</ul>
	        	</td>
        	</tr>
        	<tr>
	        	<td>Languages</td>
	        	<td>
	        	<ul>
	        	<c:forEach items="${languages}" var="listVar">
	        	<li><c:out value="${listVar.language}"/></li>
				</c:forEach>
	        	</ul>
	        	</td>
        	</tr>

		  </tbody>
		</table>
        </div>
</c:if>
</body>
</html>
