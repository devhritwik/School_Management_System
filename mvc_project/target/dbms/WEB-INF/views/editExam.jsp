<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="exam" action="/dbms/admin/editExamResult">
		
		<table>
		
		<form:hidden path="date"/> <form:errors path="date"/>
		<form:hidden path="type"/> <form:errors path="type"/>
		<form:hidden path="subjectCode"/> <form:errors path="subjectCode"/>
		
		<tr><td>time</td><td>
		<form:input path="time" type="time" step="1" value="${exam.time}"/> </td><!-- bind to user.name-->
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