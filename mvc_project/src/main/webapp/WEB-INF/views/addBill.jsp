<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url var="style" value="/style" />

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Add Bill</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
<%@include file="./shared/navbarAccountant.jsp" %>
<div class="wrapper">
	<form:form method="post" modelAttribute="bill" action="/dbms/accountant/billSection/addBill">
		
		<table>
		<caption>Add Bill</caption>
		<form:hidden path="billNo"/> <form:errors path="billNo"/>
		<form:hidden path="throughAccountant"/> <form:errors path="throughAccountant"/>
		<tbody>
		
		<tr><td>date</td><td>
		<form:input path="date" type="date"  required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="date" /></td></tr>
		
		<tr><td>amount</td><td>
		<form:input path="amount" type="text"  required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="amount" /></td></tr>
		
		<tr><td>concession</td><td>
		<form:input path="concession" type="text"  required="required"/> </td><!-- bind to user.name-->
		<td><form:errors path="concession" /></td></tr>
		
		<tr><td>fine</td><td>
		<form:input path="fine" type="text" required="required" /> </td><!-- bind to user.name-->
		<td><form:errors path="fine" /></td></tr>
		
		<tr><td>feePeriod</td>
			<td><form:select path="feePeriod" required="required" >
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${feePeriodTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="feePeriod" /></td>
		</tr>
		
		<tr><td>status</td>
			<td><form:select path="status" required="required" >
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${statusTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="status" /></td>
		</tr>
		
		<tr><td>Of Student</td>
			<td><form:select path="ofStudent" required="required">
				  <form:option value="" label="--- Select ---" />
				  <form:options items="${studentTypes}" />
			    </form:select>
            </td>
		<td><form:errors path="ofStudent" /></td>
		</tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td><td></td>
		</tr>
		
		</tbody>
		</table>
	</form:form>
	</div>
</c:if>