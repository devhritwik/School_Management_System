<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your Homeworks
        </h3>
        <p>You have got ${homeworkCountByStudent} homeworks.</p>
        <table>
        <tr><th>homework ID</th><th>date</th><th>maxMarks</th><th>By Teacher</th><th>Status</th></tr>
        <c:forEach items="${homeworkListByStudent}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.homeworkID}"/></td>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.maxMarks}"/></td>
        	<td><c:out value="${listVar.byTeacher}"/></td>
        	
        </tr>
        </c:forEach>
        </table>
        
    </c:if>
</body>
</html>
