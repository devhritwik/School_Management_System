<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="report" action="/dbms/teacher/reportSection/addReport">
		
		<table>
		<form:hidden path="byTeacher"/> <form:errors path="byTeacher"/>
		<form:hidden path="reportID"/> <form:errors path="reportID"/>
		
		<tr><td>
		date</td><td>
		<form:input path="date" type="date" /> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>
		topic</td><td>
		<form:input path="topic" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="topic" /></td></tr>
		
		<tr><td>message</td><td>
		<textarea name="message" rows="10" cols="30">Enter text here!</textarea></td>
		</tr>
		
		<tr><td>
		action</td><td>
		<form:input path="action" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="action" /></td></tr>
		
		<tr><td>forStudent</td>
			<td><form:select path="forStudent">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${studentTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="forStudent" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>