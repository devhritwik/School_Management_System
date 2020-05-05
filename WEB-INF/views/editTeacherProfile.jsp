<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url var="style" value="/style" />

<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Edit Profile</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">

	<%@include file="./shared/navbarTeacher.jsp" %>
<div class="wrapper">
	<form:form method="post" modelAttribute="teacher" action="/dbms/teacher/editProfile">
		
		<table>
		<caption>Edit Profile</caption>
		
		<form:hidden path="teacherID"/> <form:errors path="teacherID"/>
		<form:hidden path="email"/>	<form:errors path="email"/>
		<form:hidden path="firstName"/> <form:errors path="firstName"/>
		<form:hidden path="salary"/> <form:errors path="salary"/>
		<form:hidden path="joinDate"/>	<form:errors path="joinDate"/>
		<form:hidden path="resignDate"/> <form:errors path="resignDate"/>
		
		<tbody>
		
		<tr><td>
		Teacher ID</td><td>
		${teacher.teacherID}</td><td></td></tr>
		
		<tr><td>
		First Name</td><td>
		${teacher.firstName}</td><td></td></tr>
		
		<tr><td>
		Middle Name</td><td>
		<form:input path="middleName" type="text" value="${teacher.middleName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="middleName" /></td></tr>
		
		<tr><td>
		Last Name</td><td>
		<form:input path="lastName" type="text" value="${teacher.lastName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="lastName" /></td></tr>
		
		<tr><td>Gender</td>
			<td><form:select path="gender" required="required" >
				  <form:option value="${teacher.gender}" label="--- Select ---" />
				  <form:options items="${genderTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="gender" /></td>
		</tr>
		
		<tr><td>DOB</td>
		<td><form:input path="DOB" type="date" value="${teacher.DOB}" required="required"/></td>
		<td><form:errors path="DOB"/></td></tr>
		
		<tr><td>Mobile No</td>
		<td>
		<form:input path="mobNo" type="text" value="${teacher.mobNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="mobNo" /></td></tr>
		
		<tr><td>
		Email ID</td><td>
		${teacher.email}</td><td></td></tr>
		
		<tr><td>House No</td>
		<td>
		<form:input path="houseNo" type="text" value="${teacher.houseNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="houseNo" /></td></tr>
		
		<tr><td>Street</td>
		<td>
		<form:input path="street" type="text" value="${teacher.street}"/> </td><!-- bind to user.name-->
		<td><form:errors path="street" /></td></tr>
		
		<tr><td>Locality</td>
		<td>
		<form:input path="locality" type="text" value="${teacher.locality}"/> </td><!-- bind to user.name-->
		<td><form:errors path="locality" /></td></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" value="${teacher.city}"/> </td><!-- bind to user.name-->
		<td><form:errors path="city" /></td></tr>
		
		<tr><td>State</td>
		<td>
		<form:input path="state" type="text" value="${teacher.state}"/> </td><!-- bind to user.name-->
		<td><form:errors path="state" /></td></tr>
		
		<tr><td>Pin Code</td>
		<td>
		<form:input path="pincode" type="text" value="${teacher.pincode}"/> </td><!-- bind to user.name-->
		<td><form:errors path="pincode" /></td></tr>
		
		<tr><td>Aadhar No</td>
		<td>
		<form:input path="aadharNo" type="text" value="${teacher.aadharNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="aadharNo" /></td></tr>
		
		<tr><td>
		Salary</td><td>
		${teacher.salary}</td><td></td></tr>
		
		<tr><td>Marital Status</td>
			<td><form:select path="maritalStatus">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${typesList}" />
			    </form:select>
            </td>
		<td><form:errors path="maritalStatus" /></td>
		</tr>
		
		<tr><td>Qualification</td>
		<td>
		<form:input path="qualification" type="text" value="${teacher.qualification}" required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="qualification" /></td></tr>
		
		<tr><td>
		Join Date</td><td>
		${teacher.joinDate}</td><td></td></tr>
		
		<tr><td>
		Resign Date</td><td>
		${teacher.resignDate}</td><td></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		<tr><td><a href="/dbms/teacher/editProfile/editLanguages">Add Languages</a></td><td></td><td></td></tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>