<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	
		
		<h3>Edit Marks
        </h3>
        date: ${currentDate}
        
        <form:form method="post" action="/dbms/teacher/examSection/editMarksResult" modelAttribute="marksList">
			<table>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>type</th>
				<th>subjectCode</th>
				<th>studentID</th>
				<th>marksObtained</th>
			</tr>
			<c:forEach items="${marksList.marks}" var="marks" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><input name="marks[${status.index}].date" value="${marks.date}" type="date" readonly /></td>
					<td><input name="marks[${status.index}].type" value="${marks.type}" type="text" readonly /></td>
					<td><input name="marks[${status.index}].subjectCode" value="${marks.subjectCode}" type="text" readonly /></td>
					<td><input name="marks[${status.index}].studentID" value="${marks.studentID}" type="text" readonly /></td>
					<td><input name="marks[${status.index}].marksObtained" value="${marks.marksObtained}" type="text" /></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<input type="submit" value="Save" />
		
		</form:form>
	
</c:if>