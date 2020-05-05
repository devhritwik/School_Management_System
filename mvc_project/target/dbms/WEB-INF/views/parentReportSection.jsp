<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your Ward's Reports
        </h3>
        <p>You have got ${reportCountByParent} reports.</p>
        <table>
        <tr><th>Report ID</th><th>date</th><th>topic</th>
        <th>message</th><th>action</th><th>For Student</th><th>By Teacher</th></tr>
        <c:forEach items="${reportListByParent}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.reportID}"/></td>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.topic}"/></td>
        	<td><c:out value="${listVar.message}"/></td>
        	<td><c:out value="${listVar.action}"/></td>
        	<td><c:out value="${listVar.forStudent}"/></td>
        	<td><c:out value="${listVar.byTeacher}"/></td>
        </tr>
        </c:forEach>
        </table>
        
    </c:if>
</body>
</html>
