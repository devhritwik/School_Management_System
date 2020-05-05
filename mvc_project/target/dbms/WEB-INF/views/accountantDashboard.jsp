<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

        <div>
        
        	<h1>${topic}</h1>
        	<table>
        	
        	<tr>
	        	<td>Accountant ID</td>
	        	<td>${accountant.accountantID}</td>
        	</tr>
        	<tr>
	        	<td>First Name</td>
	        	<td>${accountant.firstName}</td>
        	</tr>
        	<tr>
	        	<td>Middle Name</td>
	        	<td>${accountant.middleName}</td>
        	</tr>
        	<tr>
	        	<td>Last Name</td>
	        	<td>${accountant.lastName}</td>
        	</tr>
        	<tr>
	        	<td>gender</td>
	        	<td>${accountant.gender}</td>
        	</tr>
        	<tr>
	        	<td>Mobile No</td>
	        	<td>${accountant.mobNo}</td>
        	</tr>
        	<tr>
	        	<td>Email ID</td>
	        	<td>${accountant.email}</td>
        	</tr>
        	<tr>
	        	<td>Work Type</td>
	        	<td>${accountant.workType}</td>
        	</tr>
        	<tr>
	        	<td>Salary</td>
	        	<td>${accountant.salary}</td>
        	</tr>
        	<tr>
	        	<td>Join Date</td>
	        	<td>${accountant.joinDate}</td>
        	</tr>
        	<tr>
	        	<td>Resign Date</td>
	        	<td>${accountant.resignDate}</td>
        	</tr>
        	
        	</table>
        	
        
        </div>
        

</body>
</html>
