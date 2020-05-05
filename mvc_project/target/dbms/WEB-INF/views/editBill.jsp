<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<form:form method="post" modelAttribute="bill" action="/dbms/accountant/billSection/editBill/${bill.billNo}">
		
		<table>
		<form:hidden path="billNo"/> <form:errors path="billNo"/>
		<form:hidden path="throughAccountant"/> <form:errors path="throughAccountant"/>
		
		<tr><td>date</td><td>
		<form:input path="date" type="date" /> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>amount</td><td>
		<form:input path="amount" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="amount" /></td></tr>
		
		<tr><td>concession</td><td>
		<form:input path="concession" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="concession" /></td></tr>
		
		<tr><td>fine</td><td>
		<form:input path="fine" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="fine" /></td></tr>
		
		<tr><td>feePeriod</td><td>
		<form:input path="feePeriod" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="feePeriod" /></td></tr>
		
		<tr><td>status</td><td>
		<form:input path="status" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="status" /></td></tr>
		
		<tr><td>ofStudent</td><td>
		<form:input path="ofStudent" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="ofStudent" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
		</tr>
		
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
</c:if>