<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="student" action="/dbms/student/editProfile">
		
		<table>
		<form:hidden path="studentID"/> <form:errors path="studentID"/>
		<form:hidden path="email"/>	<form:errors path="email"/>
		<form:hidden path="firstName"/> <form:errors path="firstName"/>
		<form:hidden path="parentID"/>	<form:errors path="parentID"/>
		<form:hidden path="classID"/> <form:errors path="classID"/>
		<form:hidden path="admissionYear"/> <form:errors path="admissionYear"/>
		
		
		<tr><td>
		Student ID</td><td>
		${student.studentID}</td></tr>
		
		<tr><td>
		First Name</td><td>
		${student.firstName}</td></tr>
		
		<tr><td>
		Middle Name</td><td>
		<form:input path="middleName" type="text" value="${student.middleName}" /> </td><!-- bind to user.name-->
		<td><form:errors path="middleName" /></td></tr>
		
		<tr><td>
		Last Name</td><td>
		<form:input path="lastName" type="text" value="${student.lastName}"/> </td><!-- bind to user.name-->
		<td><form:errors path="lastName" /></td></tr>
		
		<tr><td>Gender</td>
			<td><form:select path="gender">
				  <form:option value="${student.gender}" label="--- Select ---" />
				  <form:options items="${genderTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="gender" /></td>
		</tr>
		
		<tr><td>DOB</td>
		<td><form:input path="DOB" type="date" value="${student.DOB}"/></td>
		<td><form:errors path="DOB"/></td></tr>
		
		<tr><td>Mobile No</td>
		<td>
		<form:input path="mobNo" type="text" value="${student.mobNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="mobNo" /></td></tr>
		
		<tr><td>
		Email ID</td><td>
		${student.email}</td></tr>
		
		<tr><td>House No</td>
		<td>
		<form:input path="houseNo" type="text" value="${student.houseNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="houseNo" /></td></tr>
		
		<tr><td>Street</td>
		<td>
		<form:input path="street" type="text" value="${student.street}"/> </td><!-- bind to user.name-->
		<td><form:errors path="street" /></td></tr>
		
		<tr><td>Locality</td>
		<td>
		<form:input path="locality" type="text" value="${student.locality}"/> </td><!-- bind to user.name-->
		<td><form:errors path="locality" /></td></tr>
		
		<tr><td>City</td>
		<td>
		<form:input path="city" type="text" value="${student.city}" /> </td><!-- bind to user.name-->
		<td><form:errors path="city" /></td></tr>
		
		<tr><td>State</td>
		<td>
		<form:input path="state" type="text" value="${student.state}"/> </td><!-- bind to user.name-->
		<td><form:errors path="state" /></td></tr>
		
		<tr><td>Pin Code</td>
		<td>
		<form:input path="pincode" type="text" value="${student.pincode}"/> </td><!-- bind to user.name-->
		<td><form:errors path="pincode" /></td></tr>
		
		<tr><td>
		Parent ID</td><td>
		${student.parentID}</td></tr>
		
		<tr><td>
		Class ID</td><td>
		${student.classID}</td></tr>
		
		<tr><td>Blood Group</td>
			<td><form:select path="bloodGp">
				  <form:option value="${student.bloodGp}" label="--- Select ---" />
				  <form:options items="${bloodTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="bloodGp" /></td>
		</tr>
		
		<tr><td>
		Admission Year</td><td>
		${student.admissionYear}</td></tr>
		
		<tr><td>Aadhar No</td>
		<td>
		<form:input path="aadharNo" type="text" value="${student.aadharNo}"/> </td><!-- bind to user.name-->
		<td><form:errors path="aadharNo" /></td></tr>
		
		<tr><td>Category</td>
			<td><form:select path="category">
				  <form:option value="${student.category}" label="--- Select ---" />
				  <form:options items="${categoryTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="category" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td><a href="/dbms/student/editProfile/editHobbies">Add Hobbies</a></td></tr>
		<tr><td><a href="/dbms/student/editProfile/editLanguages">Add Languages</a></td></tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>