<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your teaching schedule
        </h3>
        <table>
        <tr><th>day</th><th>periodNo</th><th>classID</th><th>subjectCode</th></tr>
        <c:forEach items="${scheduleListByTeacher}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.day}"/></td>
        	<td><c:out value="${listVar.periodNo}"/></td>
        	<td><c:out value="${listVar.classID}"/></td>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        </tr>
        </c:forEach>
        </table>
    </c:if>
</body>
</html>
