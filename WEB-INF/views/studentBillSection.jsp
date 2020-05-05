<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page session="true"%>
<spring:url var="style" value="/style" />
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<html>
<title>Fees Section</title>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <%@include file="./shared/navbar.jsp" %>
        <div class="wrapper">
        <h5>You have got ${billCountByStudent} bills.</h5>
        
		<table>
		  <caption>Your Fees</caption>
		  <thead>
		    <tr><th>Bill No</th><th>date</th><th>amount</th>
        <th>concession</th><th>fine</th><th>fee Period</th><th>status</th><th>Accountant</th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${billListByStudent}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.billNo}"/></td>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.amount}"/></td>
	        	<td><c:out value="${listVar.concession}"/></td>
	        	<td><c:out value="${listVar.fine}"/></td>
	        	<td><c:out value="${listVar.feePeriod}"/></td>
	        	<td><c:out value="${listVar.status}"/></td>
	        	<td><c:out value="${listVar.throughAccountant}"/></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        </div>
        
        
    </c:if>
</body>
</html>
