<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<spring:url var="style" value="/style" />

<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Add Homework</title>
</head>

<c:if test="${pageContext.request.userPrincipal.name != null}">
  <%@include file="./shared/navbarTeacher.jsp" %>
  <div class="wrapper">
  <form:form method="post" modelAttribute="homework" action="/dbms/teacher/homeworkSection/addHomework">
    
    <table>
    <caption>Add Homework</caption>
    <form:hidden path="byTeacher"/> <form:errors path="byTeacher"/>
    <form:hidden path="homeworkID"/> <form:errors path="homeworkID"/>
    
    <tbody>
    <tr><td>
    date</td><td>
    <form:input path="date" type="date" value="${homework.date}" required="required"/> </td><!-- bind to user.name-->
    <td><form:errors path="date" /></td></tr>
    
    <tr><td>
    max Marks</td><td>
    <form:input path="maxMarks" type="text"  required="required"/> </td><!-- bind to user.name-->
    <td><form:errors path="maxMarks" /></td></tr>
    
    
    <tr><td>subject Code</td>
		<td><form:select path="subjectCode" required="required">
			  <form:option value="" label="--- Select ---" />
			  <form:options items="${subjectTypes}" />
		    </form:select>
           </td>
	<td><form:errors path="subjectCode" /></td>
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