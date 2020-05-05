<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your today's schedule
        </h3>
        <table>
        <tr><th>date</th><th>type</th><th>subjectCode</th>
        <th>time</th><th>roomNo</th><th>maxMarks</th>
        </tr>
        <c:forEach items="${exams}" var="listVar">
        <tr>
        	
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.type}"/></td>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<td><c:out value="${listVar.time}"/></td>
        	<td><c:out value="${listVar.roomNo}"/></td>
        	<td><c:out value="${listVar.maxMarks}"/></td>
        	
        	<td><a href="/dbms/teacher/examSection/editMarks/${listVar.date}/${listVar.type}/${listVar.subjectCode}">Edit Marks</a></td>
        </tr>
        </c:forEach>
        </table>
    </c:if>
</body>
</html>
