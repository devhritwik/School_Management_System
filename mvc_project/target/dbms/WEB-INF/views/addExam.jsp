<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="exam" action="/dbms/admin/addExam">
		
		<table>
		
		<tr><td>date</td><td>
		<form:input path="date" type="date" value="${exam.date}"/> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>type</td><td>
		<form:input path="type" type="text" value="${exam.type}"/> </td><!-- bind to user.name-->
		<td><form:errors path="type" /></td></tr>
		
		<tr><td>subjectCode</td><td>
		<form:input path="subjectCode" type="text" value="${exam.subjectCode}" /> </td><!-- bind to user.name-->
		<td><form:errors path="subjectCode" /></td></tr>
		
		<tr><td>time</td><td>
		<form:input path="time" type="time" value="${exam.time}"/> </td><!-- bind to user.name-->
		<td><form:errors path="time" /></td></tr>
		
		<tr><td>roomNo</td><td>
		<form:input path="roomNo" type="text" value="${exam.roomNo}" /> </td><!-- bind to user.name-->
		<td><form:errors path="roomNo" /></td></tr>
		
		<tr><td>maxMarks</td><td>
		<form:input path="maxMarks" type="text" value="${exam.maxMarks}" /> </td><!-- bind to user.name-->
		<td><form:errors path="maxMarks" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>