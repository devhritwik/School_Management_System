<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="student" action="/dbms/admin/editStudent/${student.studentID}">
		
		<table>
		
		<form:hidden path="studentID"/> <form:errors path="studentID"/>
		<form:hidden path="middleName"/> <form:errors path="studentID"/>
		<form:hidden path="lastName"/> <form:errors path="firstName"/>
		<form:hidden path="gender"/> <form:errors path="studentID"/>
		<form:hidden path="DOB"/>	<form:errors path="email"/>
		<form:hidden path="mobNo"/> <form:errors path="firstName"/>
		<form:hidden path="houseNo"/> <form:errors path="studentID"/>
		<form:hidden path="street"/>	<form:errors path="email"/>
		<form:hidden path="locality"/> <form:errors path="firstName"/>
		<form:hidden path="city"/> <form:errors path="studentID"/>
		<form:hidden path="state"/> <form:errors path="firstName"/>
		<form:hidden path="pincode"/> <form:errors path="studentID"/>
		<form:hidden path="bloodGp"/>	<form:errors path="email"/>
		<form:hidden path="aadharNo"/> <form:errors path="firstName"/>
		<form:hidden path="category"/> <form:errors path="studentID"/>
		
		<tr><td>First Name</td>
		<td>
		<form:input path="firstName" type="text" value="${student.firstName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="firstName" /></td></tr>
		
		<tr><td>Email ID</td>
		<td>
		<form:input path="email" type="text" value="${student.email}"/> </td><!-- bind to user.name-->
		<td><form:errors path="email" /></td></tr>
		
		<tr><td>Parent ID</td>
			<td><form:select path="parentID">
				  <form:option value="${student.parentID}" label="--- Select ---" />
				  <form:options items="${parentTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="parentID" /></td>
		</tr>
		
		<tr><td>Class ID</td>
			<td><form:select path="classID">
				  <form:option value="${student.classID}" label="--- Select ---" />
				  <form:options items="${classTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="classID" /></td>
		</tr>
		
		<tr><td>Admission Year</td>
		<td>
		<form:input path="admissionYear" type="text" value="${student.admissionYear}"/> </td><!-- bind to user.name-->
		<td><form:errors path="admissionYear" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>