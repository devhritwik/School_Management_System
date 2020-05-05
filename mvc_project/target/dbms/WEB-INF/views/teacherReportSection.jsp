<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your Reports
        </h3>
        <p>You have submitted ${reportCountByTeacher} reports.</p>
        <table>
        <tr><th>Report ID</th><th>date</th><th>topic</th>
        <th>message</th><th>action</th><th>For Student</th></tr>
        <c:forEach items="${reportListByTeacher}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.reportID}"/></td>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.topic}"/></td>
        	<td><c:out value="${listVar.message}"/></td>
        	<td><c:out value="${listVar.action}"/></td>
        	<td><c:out value="${listVar.forStudent}"/></td>
        	<td><a href="/dbms/teacher/reportSection/editReport/${listVar.reportID}">Edit</a></td>
        	<td><a href="/dbms/teacher/reportSection/deleteReport/${listVar.reportID}">Delete</a></td>
        	
        </tr>
        </c:forEach>
        </table>
        <a href="/dbms/teacher/reportSection/addReport">Add Report</a>
        
    </c:if>
</body>
</html>
