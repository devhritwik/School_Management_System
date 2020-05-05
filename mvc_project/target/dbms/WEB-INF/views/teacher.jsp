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
        <h3>Hello teacher role login works!!</h3>
        <div>
        <a href="/dbms/teacher/dashboard">Dashboard</a>
        <a href="/dbms/teacher/editProfile">Edit Profile</a>
        <a href="/dbms/teacher/reportSection">Reports Section</a>
        <a href="/dbms/teacher/homeworkSection">Homework Section</a>
        <a href="/dbms/teacher/scheduleSection">Schedule Section</a>
        <a href="/dbms/teacher/attendanceSection">Attendance Section</a>
        <a href="/dbms/teacher/examSection">Exam Section</a>
        
        </div>
    </c:if>
</body>
</html>
