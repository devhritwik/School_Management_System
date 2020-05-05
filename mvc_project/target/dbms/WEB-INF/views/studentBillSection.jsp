<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your Bills
        </h3>
        <p>You have got ${billCountByStudent} bills.</p>
        <table>
        <tr><th>Bill No</th><th>date</th><th>amount</th>
        <th>concession</th><th>fine</th><th>feePeriod</th><th>status</th><th>throughAccountant</th></tr>
        <c:forEach items="${billListByStudent}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.billNo}"/></td>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.amount}"/></td>
        	<td><c:out value="${listVar.concession}"/></td>
        	<td><c:out value="${listVar.fine}"/></td>
        	<td><c:out value="${listVar.feePeriod}"/></td>
        	<td><c:out value="${listVar.status}"/></td>
        	<td><c:out value="${listVar.throughAccountant}"/></td>
        </tr>
        </c:forEach>
        </table>
        
    </c:if>
</body>
</html>
