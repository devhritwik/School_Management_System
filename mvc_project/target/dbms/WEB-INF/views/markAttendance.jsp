<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	
		
		<h3>Mark Attendance
        </h3>
        date: ${currentDate}
        
        <form:form method="post" action="/dbms/teacher/attendanceSection/markAttendanceResult" modelAttribute="attendanceList">
			<table>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>preiodNo</th>
				<th>studentID</th>
				<th>status</th>
			</tr>
			<c:forEach items="${attendanceList.attendances}" var="attendance" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><input name="attendances[${status.index}].date" value="${attendance.date}" type="date" readonly /></td>
					<td><input name="attendances[${status.index}].periodNo" value="${attendance.periodNo}" type="text" readonly /></td>
					<td><input name="attendances[${status.index}].studentID" value="${attendance.studentID}" type="text" readonly /></td>
					<td><form:select path="attendances[${status.index}].status">
						  <form:option value="" label="--- Select ---" />
						  <form:options items="${attendanceTypes}" />
					    </form:select>
		            </td>
					
					
				</tr>
			</c:forEach>
		</table>
		<br/>
		<input type="submit" value="Save" />
		
		</form:form>
	
</c:if>