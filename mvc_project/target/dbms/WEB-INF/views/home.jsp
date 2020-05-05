<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
</head>
<body>
	<h1>Name : ${name}</h1>
	<h1>Description : ${description}</h1>
	<br>
	<h2>
		<a href="/dbms/login">Click here to login</a>
	</h2>
</body>
</html>