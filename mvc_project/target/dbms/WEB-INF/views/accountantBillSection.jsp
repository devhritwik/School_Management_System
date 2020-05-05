<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        
        <h3>Your Bills
        </h3>
        <p>You have made ${billCountByAccountant} bills.</p>
        <table>
        <tr><th>Bill No</th><th>date</th><th>amount</th>
        <th>concession</th><th>fine</th><th>feePeriod</th><th>status</th><th>ofStudent</th></tr>
        <c:forEach items="${billListByAccountant}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.billNo}"/></td>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.amount}"/></td>
        	<td><c:out value="${listVar.concession}"/></td>
        	<td><c:out value="${listVar.fine}"/></td>
        	<td><c:out value="${listVar.feePeriod}"/></td>
        	<td><c:out value="${listVar.status}"/></td>
        	<td><c:out value="${listVar.ofStudent}"/></td>
        	<td><a href="/dbms/accountant/billSection/editBill/${listVar.billNo}">Edit</a></td>
        	<td><a href="/dbms/accountant/billSection/deleteBill/${listVar.billNo}">Delete</a></td>
        </tr>
        </c:forEach>
        </table>
        <a href="/dbms/accountant/billSection/addBill">Make a new bill</a>
        
    </c:if>
</body>
</html>
