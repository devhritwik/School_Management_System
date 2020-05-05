<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="parent" action="/dbms/parent/editProfile">
	

		<table>
		<form:hidden path="parentID"/> <form:errors path="parentID"/>
		
		<tr><td>
		Parent ID</td><td>
		${parent.parentID}</td></tr>
		
		<tr><td>
		Father's First Name</td><td>
		<form:input path="fatherFirstName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherFirstName" /></td></tr>
		
		<tr><td>
		Father's Middle Name</td><td>
		<form:input path="fatherMiddleName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherMiddleName" /></td></tr>
		
		<tr><td>
		Father's Last Name</td><td>
		<form:input path="fatherLastName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherLastName" /></td></tr>
		
		<tr><td>
		Mother's First Name</td><td>
		<form:input path="motherFirstName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherFirstName" /></td></tr>
		
		<tr><td>Mother's Middle Name</td>
		<td><form:input path="motherMiddleName" type="date" /></td>
		<td><form:errors path="motherMiddleName"/></td></tr>
		
		<tr><td>Mother's Last Name</td>
		<td>
		<form:input path="motherLastName" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherLastName" /></td></tr>
		
		<tr><td>Father's Mobile No</td>
		<td>
		<form:input path="fatherMobNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherMobNo" /></td></tr>
		
		<tr><td>Mother's Mobile No</td>
		<td>
		<form:input path="motherMobNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherMobNo" /></td></tr>
		
		<tr><td>Father's Email ID</td>
		<td>
		<form:input path="fatherEmail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherEmail" /></td></tr>
		
		<tr><td>Mother's Email ID</td>
		<td>
		<form:input path="motherEmail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherEmail" /></td></tr>
		
		<tr><td>Father's Profession</td>
		<td>
		<form:input path="fatherProfession" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherProfession" /></td></tr>
		
		<tr><td>Mother's Profession</td>
		<td>
		<form:input path="motherProfession" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherProfession" /></td></tr>
		
		<tr><td>Father's Salary</td>
		<td>
		<form:input path="fatherSalary" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherSalary" /></td></tr>
		
		<tr><td>Mother's Salary</td>
		<td>
		<form:input path="motherSalary" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherSalary" /></td></tr>
		
		<tr><td>Father's Aadhar No</td>
		<td>
		<form:input path="fatherAadharNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherAadharNo" /></td></tr>
		
		<tr><td>Mother's Aadhar No</td>
		<td>
		<form:input path="motherAadharNo" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherAadharNo" /></td></tr>
		
		<tr><td>Father's Qualification</td>
		<td>
		<form:input path="fatherQualification" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fatherQualification" /></td></tr>
		
		<tr><td>Mother's Qualification</td>
		<td>
		<form:input path="motherQualification" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="motherQualification" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>