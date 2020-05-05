<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="accountant" action="/dbms/accountant/editProfile">
		
		<table>
		<form:hidden path="accountantID"/> <form:errors path="accountantID"/>
		<form:hidden path="email"/>	<form:errors path="email"/>
		<form:hidden path="firstName"/> <form:errors path="firstName"/>
		
		<tr><td>
		Accountant ID</td><td>
		${accountant.accountantID}</td></tr>
		
		<tr><td>
		First Name</td><td>
		${accountant.firstName}</td></tr>
		
		<tr><td>
		Middle Name</td><td>
		<form:input path="middleName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="middleName" /></td></tr>
		
		<tr><td>
		Last Name</td><td>
		<form:input path="lastName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="lastName" /></td></tr>
		
		<tr><td>
		Gender</td><td>
		<form:input path="gender" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="gender" /></td></tr>
		
		<tr><td>Mobile No</td>
		<td>
		<form:input path="mobNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mobNo" /></td></tr>
		
		<tr><td>
		Email ID</td><td>
		${accountant.email}</td></tr>
		
		<tr><td>
		Work Type</td><td>
		${accountant.workType}</td></tr>
		
		<tr><td>
		Salary</td><td>
		${accountant.salary}</td></tr>
		
		<tr><td>
		Join Date</td><td>
		${accountant.joinDate}</td></tr>
		
		<tr><td>
		Resign Date</td><td>
		${accountant.resignDate}</td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>