<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
    <h1>Name : ${name}</h1>
    <h1>Description : ${description}</h1>
 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | <a
                href="<c:url value="/j_spring_security_logout" />"> Logout</a>
        </h2>
        <h3>Hello parent role login works!!</h3>
        <div>
        <a href="/dbms/parent/dashboard">Dashboard</a>
        <a href="/dbms/parent/editProfile">Edit Profile</a>
        <a href="/dbms/parent/reportSection">Reports Section</a>
        </div>
    </c:if>
</body>
</html>
