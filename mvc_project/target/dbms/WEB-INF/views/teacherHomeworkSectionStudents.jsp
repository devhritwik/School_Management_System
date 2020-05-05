<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Students having ${listVar.homeworkID}-Homework
        </h3>
        <p>${StudentCountByTeacherHomework} students have got this homework.
        </p>
        <table>
        <tr><th>student ID</th><th>Status</th></tr>
        <c:forEach items="${StudentsByTeacherHomework}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.homeworkID}"/></td>
        	<td><c:out value="${listVar.studentID}"/></td>
        	<td><c:out value="${listVar.status}"/></td>
        </tr>
        </c:forEach>
        </table>
        
    </c:if>
</body>
</html>
