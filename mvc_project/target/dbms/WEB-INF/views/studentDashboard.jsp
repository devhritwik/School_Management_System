<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
 
    
        <div>
        
        	<h1>${topic}</h1>
        	
        	<table>
        	
        	<tr>
	        	<td>Student ID</td>
	        	<td>${student.studentID}</td>
        	</tr>
        	<tr>
	        	<td>First Name</td>
	        	<td>${student.firstName}</td>
        	</tr>
        	<tr>
	        	<td>Middle Name</td>
	        	<td>${student.middleName}</td>
        	</tr>
        	<tr>
	        	<td>Last Name</td>
	        	<td>${student.lastName}</td>
        	</tr>
        	<tr>
	        	<td>gender</td>
	        	<td>${student.gender}</td>
        	</tr>
        	<tr>
	        	<td>DOB</td>
	        	<td>${student.DOB}</td>
        	</tr>
        	<tr>
	        	<td>Mobile No</td>
	        	<td>${student.mobNo}</td>
        	</tr>
        	<tr>
	        	<td>Email ID</td>
	        	<td>${student.email}</td>
        	</tr>
        	<tr>
	        	<td>House No</td>
	        	<td>${student.houseNo}</td>
        	</tr>
        	<tr>
	        	<td>Street</td>
	        	<td>${student.street}</td>
        	</tr>
        	<tr>
	        	<td>Locality</td>
	        	<td>${student.locality}</td>
        	</tr>
        	<tr>
	        	<td>City</td>
	        	<td>${student.city}</td>
        	</tr>
        	<tr>
	        	<td>State</td>
	        	<td>${student.state}</td>
        	</tr>
        	<tr>
	        	<td>Pin Code</td>
	        	<td>${student.pincode}</td>
        	</tr>
        	<tr>
	        	<td>Parent ID</td>
	        	<td>${student.parentID}</td>
        	</tr>
        	<tr>
	        	<td>Class ID</td>
	        	<td>${student.classID}</td>
        	</tr>
        	<tr>
	        	<td>Blood Group</td>
	        	<td>${student.bloodGp}</td>
        	</tr>
        	<tr>
	        	<td>Admission Year</td>
	        	<td>${student.admissionYear}</td>
        	</tr>
        	<tr>
	        	<td>Aadhar No</td>
	        	<td>${student.aadharNo}</td>
        	</tr>
        	<tr>
	        	<td>Category</td>
	        	<td>${student.category}</td>
        	</tr>
        	<tr>
	        	<td>Hobbies</td>
	        	<td>
	        	<ul>
	        	<c:forEach items="${hobbies}" var="listVar">
	        	<li><c:out value="${listVar.hobby}"/></li>
				</c:forEach>
	        	</ul>
	        	</td>
        	</tr>
        	<tr>
	        	<td>Languages</td>
	        	<td>
	        	<ul>
	        	<c:forEach items="${languages}" var="listVar">
	        	<li><c:out value="${listVar.language}"/></li>
				</c:forEach>
	        	</ul>
	        	</td>
        	</tr>
        	
        	
        	
        	</table>
        	
        
        </div>
        
        
</body>
</html>
