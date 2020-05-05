<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url var="style" value="/style" />
<%@page session="true"%>
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<head>
<title>${user}|Teacher</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<html>
<body>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <%@include file="./shared/navbarTeacher.jsp" %>
    </c:if>
</body>
</html>
