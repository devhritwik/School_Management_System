<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="teacher" action="/dbms/teacher/editProfile">
		
		<table>
		<form:hidden path="teacherID"/> <form:errors path="teacherID"/>
		<form:hidden path="email"/>	<form:errors path="email"/>
		<form:hidden path="firstName"/> <form:errors path="firstName"/>
		<form:hidden path="salary"/> <form:errors path="salary"/>
		<form:hidden path="joinDate"/>	<form:errors path="joinDate"/>
		<form:hidden path="resignDate"/> <form:errors path="resignDate"/>
		
		
		<tr><td>
		Teacher ID</td><td>
		${teacher.teacherID}</td></tr>
		
		<tr><td>
		First Name</td><td>
		${teacher.firstName}</td></tr>
		
		<tr><td>
		Middle Name</td><td>
		<form:input path="middleName" type="text" value="${teacher.middleName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="middleName" /></td></tr>
		
		<tr><td>
		Last Name</td><td>
		<form:input path="lastName" type="text" value="${teacher.lastName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="lastName" /></td></tr>
		
		<tr><td>Gender</td>
			<td><form:select path="gender">
				  <form:option value="${teacher.gender}" label="--- Select ---" />
				  <form:options items="${genderTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="gender" /></td>
		</tr>
		
		<tr><td>DOB</td>
		<td><form:input path="DOB" type="date" value="${teacher.DOB}"/></td>
		<td><form:errors path="DOB"/></td></tr>
		
		<tr><td>Mobile No</td>
		<td>
		<form:input path="mobNo" type="text" value="${teacher.mobNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="mobNo" /></td></tr>
		
		<tr><td>
		Email ID</td><td>
		${teacher.email}</td></tr>
		
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
		${teacher.salary}</td></tr>
		
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
		<form:input path="qualification" type="text" value="${teacher.qualification}"/> </td><!-- bind to user.name-->
		<td><form:errors path="qualification" /></td></tr>
		
		<tr><td>
		Join Date</td><td>
		${teacher.joinDate}</td></tr>
		
		<tr><td>
		Resign Date</td><td>
		${teacher.resignDate}</td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		
		<tr><td><a href="/dbms/teacher/editProfile/editLanguages">Add Languages</a></td></tr>
		
		</table>
	</form:form>
</c:if>