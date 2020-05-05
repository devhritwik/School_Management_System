<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url var="style" value="/style" />
<%@page session="true"%>
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Logout</title>
</head>

<body>
 <%@include file="./shared/navbarHome.jsp" %>
 <div class="wrapper">
 <h1><br/>You have successfully logged off!</h1>
 <a href="/dbms/login"><button type="button">Click here to login again</button></a>
 </div>
 
</body>
</html>