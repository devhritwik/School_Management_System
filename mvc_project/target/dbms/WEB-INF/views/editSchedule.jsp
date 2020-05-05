<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="schedule" action="/dbms/admin/editScheduleResult">
		
		<table>
		
		<tr><td>day</td><td>
		<form:input path="day" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="day" /></td></tr>
		
		<tr><td>periodNo</td><td>
		<form:input path="periodNo" type="number" min="0" max="8"/> </td><!-- bind to user.name-->
		<td><form:errors path="periodNo" /></td></tr>
		
		<tr><td>classID</td><td>
		<form:input path="classID" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="classID" /></td></tr>
		
		<tr><td>teacherID</td><td>
		<form:input path="teacherID" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="teacherID" /></td></tr>
		
		<tr><td>subjectCode</td><td>
		<form:input path="subjectCode" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="subjectCode" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>