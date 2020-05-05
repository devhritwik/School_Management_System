<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="class1" action="/dbms/admin/addClass">
		
		<table>
		
		<tr><td>className</td><td>
		<form:input path="className" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="className" /></td></tr>
		
		<tr><td>roomNo</td><td>
		<form:input path="roomNo" type="text"/> </td><!-- bind to user.name-->
		<td><form:errors path="roomNo" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>