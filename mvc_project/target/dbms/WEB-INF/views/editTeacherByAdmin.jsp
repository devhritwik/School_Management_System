<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="teacher" action="/dbms/admin/editTeacher/${teacher.teacherID}">
		
		<table>
		<form:hidden path="teacherID"/> <form:errors path="teacherID"/>
		<form:hidden path="middleName"/> <form:errors path="middleName"/>
		<form:hidden path="lastName"/> <form:errors path="lastName"/>
		<form:hidden path="gender"/> <form:errors path="gender"/>
		<form:hidden path="DOB"/> <form:errors path="DOB"/>
		<form:hidden path="mobNo"/> <form:errors path="mobNo"/>
		<form:hidden path="houseNo"/> <form:errors path="houseNo"/>
		<form:hidden path="street"/> <form:errors path="street"/>
		<form:hidden path="locality"/> <form:errors path="locality"/>
		<form:hidden path="city"/> <form:errors path="city"/>
		<form:hidden path="state"/> <form:errors path="state"/>
		<form:hidden path="pincode"/> <form:errors path="pincode"/>
		<form:hidden path="aadharNo"/> <form:errors path="aadharNo"/>
		<form:hidden path="maritalStatus"/> <form:errors path="houseNo"/>
		<form:hidden path="qualification"/> <form:errors path="street"/>
		
		<tr><td>First Name</td><td>
		<form:input path="firstName" type="text" value="${teacher.firstName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="firstName" /></td></tr>
		
		<tr><td>Email ID</td>
		<td>
		<form:input path="email" type="text" value="${teacher.email}"/> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>
		
		<tr><td>Salary</td>
		<td>
		<form:input path="salary" type="text" value="${teacher.salary}"/> </td><!-- bind to user.name-->
		<td><form:errors path="salary" /></td></tr>
		
		<tr><td>Join Date</td>
		<td>
		<form:input path="joinDate" type="date" value="${teacher.joinDate}"/> </td><!-- bind to user.name-->
		<td><form:errors path="joinDate" /></td></tr>
		
		<tr><td>Resign Date</td>
		<td>
		<form:input path="resignDate" type="date" value="${teacher.resignDate}"/> </td><!-- bind to user.name-->
		<td><form:errors path="resignDate" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		</table>
	</form:form>
</c:if>