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
    
    	<%@include file="./shared/navbarParent.jsp" %>
        <div class="wrapper">
        <table>
		  <caption>Your Bills</caption>
		  <thead>
		    <tr><th>Bill No</th><th>date</th><th>of Student</th><th>amount</th>
        <th>concession</th><th>fine</th><th>fee Period</th><th>through Accountant</th><th>status</th><th></th></tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${billListByParent}" var="listVar">
		    <tr>
	      		<td><c:out value="${listVar.billNo}"/></td>
	        	<td><c:out value="${listVar.date}"/></td>
	        	<td><c:out value="${listVar.ofStudent}"/></td>
	        	<td><c:out value="${listVar.amount}"/></td>
	        	<td><c:out value="${listVar.concession}"/></td>
	        	<td><c:out value="${listVar.fine}"/></td>
	        	<td><c:out value="${listVar.feePeriod}"/></td>
	        	<td><c:out value="${listVar.throughAccountant}"/></td>
	        	<td><c:out value="${listVar.status}"/></td>
	        	<c:set value="${listVar.status}" var="str" />
	        	<c:choose>
	        		<c:when test="${str eq 'Paid'}">
	        			<td><a href="/dbms/parent/billSection/invoice/${listVar.billNo}">Get Invoice</a></td>
	        		</c:when>
	        		<c:otherwise>
	        			<td></td>
	        		</c:otherwise>
	        	</c:choose>
	        	<!-- 
	        	<td><c:out value="${str eq 'Paid' ? 'Get Invoice':'Pay Fees' }" /></td>
	        	<td><a href="/dbms/parent/billSection/invoice/${listVar.billNo}">Get Invoice</a></td>
		    	 -->
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        </div>
    </c:if>
</body>
</html>
