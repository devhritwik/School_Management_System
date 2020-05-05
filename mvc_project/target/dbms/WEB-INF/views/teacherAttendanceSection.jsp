<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your today's schedule
        </h3>
        day: ${day}
        date: ${currentDate}
        <table>
        <tr><th>periodNo</th><th>classID</th><th>subjectCode</th></tr>
        <c:forEach items="${scheduleListByDay}" var="listVar">
        <tr>
        	
        	<td><c:out value="${listVar.periodNo}"/></td>
        	<td><c:out value="${listVar.classID}"/></td>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<td><a href="/dbms/teacher/attendanceSection/markAttendance/${listVar.periodNo}/${listVar.subjectCode}/">Take Attendance</a></td>
        </tr>
        </c:forEach>
        </table>
    </c:if>
</body>
</html>
