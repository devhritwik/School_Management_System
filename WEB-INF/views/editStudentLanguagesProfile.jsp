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

<html>
<body>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<%@include file="./shared/navbar.jsp" %>
	<div class="wrapper">
	<form:form method="post" modelAttribute="studentLanguages" action="/dbms/student/editProfile/editLanguages">
		
		<table>
		<caption>Edit Profile</caption>
		<form:hidden path="studentID"/> <form:errors path="studentID"/>
		<tbody>
		
		<tr><td>
		language</td><td>
		<form:input path="language" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="language" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			<td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>

</body>
</html>