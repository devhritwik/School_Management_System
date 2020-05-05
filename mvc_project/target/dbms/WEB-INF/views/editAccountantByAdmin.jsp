<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="accountant" action="/dbms/admin/editAccountant/${accountant.accountantID}">
		
		<table>
		<form:hidden path="accountantID"/> <form:errors path="accountantID"/>
		<form:hidden path="middleName"/> <form:errors path="middleName"/>
		<form:hidden path="lastName"/> <form:errors path="lastName"/>
		<form:hidden path="gender"/> <form:errors path="gender"/>
		<form:hidden path="mobNo"/> <form:errors path="mobNo"/>
		<form:hidden path="aadharNo"/> <form:errors path="aadharNo"/>
		
		<tr><td>First Name</td><td>
		<form:input path="firstName" type="text" value="${accountant.firstName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="firstName" /></td></tr>
		
		<tr><td>Email ID</td>
		<td>
		<form:input path="email" type="text" value="${accountant.email}" /> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>
		
		<tr><td>Work Type</td>
		<td>
		<form:input path="workType" type="text" value="${accountant.workType}"/> </td><!-- bind to user.name-->
		<td><form:errors path="workType" /></td></tr>
		
		<tr><td>Salary</td>
		<td>
		<form:input path="salary" type="text" value="${accountant.salary}"/> </td><!-- bind to user.name-->
		<td><form:errors path="salary" /></td></tr>
		
		<tr><td>Join Date</td>
		<td>
		<form:input path="joinDate" type="date" value="${accountant.joinDate}"/> </td><!-- bind to user.name-->
		<td><form:errors path="joinDate" /></td></tr>
		
		<tr><td>Resign Date</td>
		<td>
		<form:input path="resignDate" type="date" value="${accountant.resignDate}"/> </td><!-- bind to user.name-->
		<td><form:errors path="resignDate" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>