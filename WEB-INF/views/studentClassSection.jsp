<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page session="true"%>
<spring:url var="style" value="/style" />
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Class Section</title>
</head>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbar.jsp" %>
        <div class="wrapper">
        <h5>You are in class ${class1.className} and you have ${subjectCountByClass} subjects as follows:</h5>
        
		<table>
		  <caption>Your Subjects</caption>
		  <thead>
		    <tr>
		    	<th>Subject Code</th><th>Subject Name</th><th>Graded or Not</th><th>Book Name</th>
        <th>Book Publications</th><th>Book Price</th><th>Notebook Type</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${subjectListByClass}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.subjectCode}"/></td>
	        	<td><c:out value="${listVar.subjectName}"/></td>
	        	<td><c:out value="${listVar.gradedOrNot}"/></td>
	        	<td><c:out value="${listVar.bookName}"/></td>
	        	<td><c:out value="${listVar.bookPublication}"/></td>
	        	<td><c:out value="${listVar.bookPrice}"/></td>
	        	<td><c:out value="${listVar.notebookType}"/></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        </div>
    </c:if>
</body>
</html>
