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
        <h3>Hello student role login works!!</h3>
        <div>
        <a href="/dbms/student/dashboard">Dashboard</a>
        <a href="/dbms/student/editProfile">Edit Profile</a>
        <a href="/dbms/student/classSection">Class Section</a>
        <a href="/dbms/student/reportSection">Reports Section</a>
        <a href="/dbms/student/homeworkSection">Homework Section</a>
        <a href="/dbms/student/billSection">Bills Section</a>
        <a href="/dbms/student/attendanceSection">Attendance Section</a>
        <a href="/dbms/student/scheduleSection">Schedule Section</a>
        <a href="/dbms/student/examSection">Exams Section</a>
        
        </div>
        
    </c:if>
</body>
</html>
