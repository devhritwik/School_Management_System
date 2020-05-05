<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url var="style" value="/style" />
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Register</title>
</head>
<html>
<body>
	<%@include file="./shared/navbarAdmin.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="user" action="/dbms/admin/register">
	
	
		<table>
		  <caption>Register</caption>
		<tbody>
		
		<tr><td>
		Username</td><td>
		<form:input path="username" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="username" /></td></tr>
		
		<tr><td>
		Password</td><td>
		<form:input path="password" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="password" /></td></tr>
		
		<tr><td>Confirm Password</td>
		<td>
		<form:input path="mpassword" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="mpassword" /></td></tr>
		
		<tr><td>First Name</td>
		<td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>E-mail ID</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>
		
		<tr><td>Type of user</td>
			<td><form:select path="type">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${typesList}" />
			    </form:select>
            </td>
		<td><form:errors path="type" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		<tr><td></td><td>${error}</td><td></td></tr>
		</tbody>
		</table>
		
	</form:form>
	</div>
</body>
</html>