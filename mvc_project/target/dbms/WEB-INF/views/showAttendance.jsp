<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	
		
		<h3>Attendance
        </h3>
        date: ${currentDate}
        
        <table>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>periodNo</th>
				<th>studentID</th>
				<th>status</th>
			</tr>
			<c:forEach items="${attendanceList.attendances}" var="attendance" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${attendance.date}</td>
					<td>${attendance.periodNo}</td>
					<td>${attendance.studentID}</td>
					<td>${attendance.status}</td>
				</tr>
			</c:forEach>
		</table>	
	
</c:if>