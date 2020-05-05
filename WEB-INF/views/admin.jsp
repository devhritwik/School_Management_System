<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page session="true"%>
<spring:url var="style" value="/style" />
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/studentReportSection.css" />

<head>
<title>Admin</title>
</head>
<html>
<body>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
    <%@include file="./shared/navbarAdmin.jsp" %>
    <div class="wrapper">
        
        
        
        <table>
		  <caption>Some Numbers</caption>
		<tbody>
        <tr>
        <td>1 admin</td>
        <td>${studentCount} students</td>
        <td>${teacherCount} teachers</td>
        <td>${parentCount} parents</td>
        <td>${accountantCount} accountants</td>
        <td>${classCount} classes</td>
        <td>${subjectCount} subjects</td>
        </tr>
        </tbody>
        </table>
        
        
        <table>
		  <caption>Teachers</caption>
		<tbody>
        <!-- <tr><th>teacherID</th><th>firstName</th><th>middleName</th><th>lastName</th><th>gender</th><th>DOB</th>
        <th>mobNo</th><th>email</th><th>houseNo</th><th>street</th><th>locality</th><th>city</th>
        <th>state</th><th>pincode</th><th>aadharNo</th>
        <th>salary</th><th>maritalStatus</th><th>qualification</th><th>joinDate</th><th>resignDate</th>
        </tr> -->
        <tr><th>teacher ID</th><th>Name</th><th></th><th></th>
        </tr>
        
        <c:forEach items="${teacherList}" var="listVar">
        <tr>
        	<td><a href="/dbms/profile/t/${listVar.teacherID}"><c:out value="${listVar.teacherID}"/></a></td>
        	<td><c:out value="${listVar.firstName} ${listVar.middleName} ${listVar.lastName}"/></td>
        	<!-- <td><c:out value="${listVar.firstName}"/></td>
        	<td><c:out value="${listVar.middleName}"/></td>
        	<td><c:out value="${listVar.lastName}"/></td>
        	<td><c:out value="${listVar.gender}"/></td>
        	<td><c:out value="${listVar.DOB}"/></td>
        	<td><c:out value="${listVar.mobNo}"/></td>
        	<td><c:out value="${listVar.email}"/></td>
        	<td><c:out value="${listVar.houseNo}"/></td>
        	<td><c:out value="${listVar.street}"/></td>
        	<td><c:out value="${listVar.locality}"/></td>
        	<td><c:out value="${listVar.city}"/></td>
        	<td><c:out value="${listVar.state}"/></td>
        	<td><c:out value="${listVar.pincode}"/></td>
        	<td><c:out value="${listVar.aadharNo}"/></td>
        	<td><c:out value="${listVar.salary}"/></td>
        	<td><c:out value="${listVar.maritalStatus}"/></td>
        	<td><c:out value="${listVar.qualification}"/></td>
        	<td><c:out value="${listVar.joinDate}"/></td>
        	<td><c:out value="${listVar.resignDate}"/></td> -->
        	<td><a href="/dbms/admin/editTeacher/${listVar.teacherID}">Edit</a></td>
        	<td><a href="/dbms/admin/deleteTeacher/${listVar.teacherID}">Delete</a></td>
        	
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        <table>
		  <caption>Students</caption>
		<tbody>
        <!-- <tr><th>studentID</th><th>firstName</th><th>middleName</th><th>lastName</th><th>gender</th><th>DOB</th>
        <th>mobNo</th><th>email</th><th>houseNo</th><th>street</th><th>locality</th><th>city</th>
        <th>state</th><th>pincode</th><th>parentID</th><th>classID</th><th>bloodGp</th><th>admissionYear</th>
        <th>aadharNo</th><th>category</th></tr> -->
        <tr><th>Student ID</th><th>Name</th><th></th><th></th></tr>
        <c:forEach items="${studentList}" var="listVar">
        <tr>
        	<td><a href="/dbms/profile/s/${listVar.studentID}"><c:out value="${listVar.studentID}"/></a></td>
        	<td><c:out value="${listVar.firstName} ${listVar.middleName} ${listVar.lastName}"/></td>
        	<!-- <td><c:out value="${listVar.studentID}"/></td>
        	<td><c:out value="${listVar.firstName}"/></td>
        	<td><c:out value="${listVar.middleName}"/></td>
        	<td><c:out value="${listVar.lastName}"/></td>
        	<td><c:out value="${listVar.gender}"/></td>
        	<td><c:out value="${listVar.DOB}"/></td>
        	<td><c:out value="${listVar.mobNo}"/></td>
        	<td><c:out value="${listVar.email}"/></td>
        	<td><c:out value="${listVar.houseNo}"/></td>
        	<td><c:out value="${listVar.street}"/></td>
        	<td><c:out value="${listVar.locality}"/></td>
        	<td><c:out value="${listVar.city}"/></td>
        	<td><c:out value="${listVar.state}"/></td>
        	<td><c:out value="${listVar.pincode}"/></td>
        	<td><c:out value="${listVar.parentID}"/></td>
        	<td><c:out value="${listVar.classID}"/></td>
        	<td><c:out value="${listVar.bloodGp}"/></td>
        	<td><c:out value="${listVar.admissionYear}"/></td>
        	<td><c:out value="${listVar.aadharNo}"/></td>
        	<td><c:out value="${listVar.category}"/></td> -->
        	<td><a href="/dbms/admin/editStudent/${listVar.studentID}">Edit</a></td>
   			<td><a href="/dbms/admin/deleteStudent/${listVar.studentID}">Delete</a></td>
   			
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        <table>
		  <caption>Parents</caption>
		<tbody>
        <tr><th>parent ID</th><th>Father's Name</th><th>Mother's Name</th></tr>
        <c:forEach items="${parentList}" var="listVar">
        <tr>
        	<td><a href="/dbms/profile/p/${listVar.parentID}"><c:out value="${listVar.parentID}"/></a></td>
        	<td><c:out value="${listVar.fatherFirstName} ${listVar.fatherMiddleName} ${listVar.fatherLastName}"/></td>
   			<td><c:out value="${listVar.motherFirstName} ${listVar.motherMiddleName} ${listVar.motherLastName}"/></td>
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        <table>
		  <caption>Accountants</caption>
		<tbody>
        <tr><th>Accountant ID</th><th>Name</th><th></th><th></th></tr>
        <c:forEach items="${accountantList}" var="listVar">
        <tr>
        	<td><a href="/dbms/profile/a/${listVar.accountantID}"><c:out value="${listVar.accountantID}"/></a></td>
        	<td><c:out value="${listVar.firstName} ${listVar.middleName} ${listVar.lastName}"/></td>
        	<td><a href="/dbms/admin/editAccountant/${listVar.accountantID}">Edit</a></td> 
   			<td><a href="/dbms/admin/deleteAccountant/${listVar.accountantID}">Delete</a></td> 
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        <table>
		  <caption>Classes</caption>
		<tbody>
        <tr><th>Class ID</th><th>Class</th><th>Room No</th><th></th><th></th></tr>
        <c:forEach items="${classList}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.classID}"/></td>
        	<td><c:out value="${listVar.className}"/></td>
        	<td><c:out value="${listVar.roomNo}"/></td>
        	 <td><a href="/dbms/admin/editClass/${listVar.classID}">Edit</a></td>
   			 <td><a href="/dbms/admin/deleteClass/${listVar.classID}">Delete</a></td> 
        </tr>
        </c:forEach>
        <tr>
        <td><a href="/dbms/admin/addClass"><button type="button">Add a new class</button></a></td>
        <td></td><td></td><td></td><td></td>
        </tr>
        </tbody>
        </table>
        
        
        <table>
		  <caption>Subjects</caption>
		<tbody>
        <tr><th>Subject Code</th><th>Subject Name</th><th></th></tr>
        <c:forEach items="${subjectList}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<td><c:out value="${listVar.subjectName}"/></td>
        	 <td><a href="/dbms/admin/editSubject/${listVar.subjectCode}">Edit</a></td>
        </tr>
        </c:forEach>
        <tr>
        <td><a href="/dbms/admin/addSubject"><button type="button">Add a new subject</button></a></td>
        <td></td><td></td>
        </tr>
        </tbody>
        </table>
        
        
        <table>
		  <caption>Reports</caption>
		<tbody>
        <tr><th>Report ID</th><th></th><th></th></tr>
        <c:forEach items="${reportList}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.reportID}"/></td>
        	 <td><a href="/dbms/admin/editReport/${listVar.reportID}">Edit</a></td> 
   			 <td><a href="/dbms/admin/deleteReport/${listVar.reportID}">Delete</a></td> 
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        <table>
		  <caption>Schedule</caption>
		<tbody>
        <tr><th>Day</th><th>period No</th><th>class ID</th><th>teacher ID</th><th>subject Code</th><th></th></tr>
        <c:forEach items="${scheduleList}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.day}"/></td>
        	<td><c:out value="${listVar.periodNo}"/></td>
        	<td><c:out value="${listVar.classID}"/></td>
        	<td><c:out value="${listVar.teacherID}"/></td>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<!-- <td><a href="/dbms/admin/editSchedule/${listVar.day}/${listVar.periodNo}/${listVar.classID}/${listVar.teacherID}/${listVar.subjectCode}">Edit</a></td>  -->
   			<td><a href="/dbms/admin/deleteSchedule/${listVar.day}/${listVar.periodNo}/${listVar.classID}/${listVar.teacherID}/${listVar.subjectCode}">Delete</a></td>
        </tr>
        </c:forEach>
        <tr>
        <td><a href="/dbms/admin/addSchedule"><button type="button">Add new</button></a></td>
        <td></td><td></td><td></td><td></td><td></td>
        </tr>
        </tbody>
        </table>
        
        <table>
		  <caption>Exams</caption>
		<tbody>
        <tr><th>date</th><th>type</th><th>subject Code</th><th>room No</th><th>maximum Marks</th><th></th></tr>
        <c:forEach items="${examList}" var="listVar">
        <tr>
        	<td><c:out value="${listVar.date}"/></td>
        	<td><c:out value="${listVar.type}"/></td>
        	<td><c:out value="${listVar.subjectCode}"/></td>
        	<td><c:out value="${listVar.roomNo}"/></td>
        	<td><c:out value="${listVar.maxMarks}"/></td>
        	<td><a href="/dbms/admin/editExam/${listVar.date}/${listVar.type}/${listVar.subjectCode}">Edit</a></td>
        </tr>
        </c:forEach>
        <tr>
        <td><a href="/dbms/admin/addExam"><button type="button">Add an exam</button></a></td>
        <td></td><td></td><td></td><td></td><td></td>
        </tr>
        </tbody>
        </table>
        
        
    </div>
        
    </c:if>
</body>
</html>
