<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your Attendance
        </h3>
        <table>
        <tr><th>date</th><th>periodNo</th><th>status</th></tr>
        <c:forEach items="${attendanceListByStudent}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.periodNo}"/></td>
        	<td><c:out value="${listVar.status}"/></td>
        </tr>
        </c:forEach>
        </table>
        
    </c:if>
</body>
</html>
