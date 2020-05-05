<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="user" action="/dbms/admin/register">
		<table><tr><td>
		Username</td><td>
		<form:input path="username" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="username" /></td></tr>
		
		<tr><td>
		Password</td><td>
		<form:input path="password" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="password" /></td></tr>
		
		<tr><td>Confirm Password</td>
		<td>
		<form:input path="mpassword" type="password" /> </td><!-- bind to user.name-->
		<td><form:errors path="mpassword" /></td></tr>
		
		<tr><td>First Name</td>
		<td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td>E-mail ID</td>
		<td>
		<form:input path="mail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="mail" /></td></tr>
		
		<tr><td>Type of user</td>
			<td><form:select path="type">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${typesList}" />
			    </form:select>
            </td>
		<td><form:errors path="type" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		</table>
		${error}
	</form:form>