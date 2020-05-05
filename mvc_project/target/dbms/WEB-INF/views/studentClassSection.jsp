<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <div>You are in class ${class1.className} and you have ${subjectCountByClass} subjects as follows:<br/>
        </div>
        
        <table>
        <tr><th>Subject Code</th><th>Subject Name</th><th>Graded or Not</th><th>Book Name</th>
        <th>Book Publications</th><th>Book Price</th><th>Notebook Type</th></tr>
        <c:forEach items="${subjectListByClass}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<td><c:out value="${listVar.subjectName}"/></td>
        	<td><c:out value="${listVar.gradedOrNot}"/></td>
        	<td><c:out value="${listVar.bookName}"/></td>
        	<td><c:out value="${listVar.bookPublication}"/></td>
        	<td><c:out value="${listVar.bookPrice}"/></td>
        	<td><c:out value="${listVar.notebookType}"/></td>
        </tr>
        </c:forEach>
        </table>
        
    </c:if>
</body>
</html>
