<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url var="css" value="/css" />
<html>
<link rel="stylesheet" type="text/css" href="${css}/bootstrap.min.css" /><head>
<link rel="stylesheet" type="text/css" href="${css}/home.css" /><head>


</head>
<body>
	<h1>SCHOOL MANAGE</h1>
	<h1>Description : ${description}</h1>
	<br>
	<h2>
		<a href="/dbms/login">Click here to login</a>
	</h2>
</body>
</html>