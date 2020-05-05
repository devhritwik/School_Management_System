<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	
		
		<h3>Marks
        </h3>
        
        <table>
			<tr>
				<th>Date</th>
				<th>type</th>
				<th>subjectCode</th>
				<th>studentID</th>
				<th>marksObtained</th>
			</tr>
			<c:forEach items="${marksList.marks}" var="marks" varStatus="status">
				<tr>
					<td>${marks.date}</td>
					<td>${marks.type}</td>
					<td>${marks.subjectCode}</td>
					<td>${marks.studentID}</td>
					<td>${marks.marksObtained}</td>
				</tr>
			</c:forEach>
		</table>	
	
</c:if>