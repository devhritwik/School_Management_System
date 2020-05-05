<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="studentLanguages" action="/dbms/student/editProfile/editLanguages">
		
		<table>
		<form:hidden path="studentID"/> <form:errors path="studentID"/>
		
		<tr><td>
		language</td><td>
		<form:input path="language" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="language" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>