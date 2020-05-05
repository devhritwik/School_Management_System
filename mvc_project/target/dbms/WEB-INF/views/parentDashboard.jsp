<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>

        <div>
        
        	<h1>${topic}</h1>
        	
        	<table>
        	
        	<tr>
	        	<td>Parent ID</td>
	        	<td>${parent.parentID}</td>
        	</tr>
        	<tr>
	        	<td>Father's Name</td>
	        	<td>${parent.fatherFirstName} ${parent.fatherMiddleName} ${parent.fatherLastName}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Name</td>
	        	<td>${parent.motherFirstName} ${parent.motherMiddleName} ${parent.motherLastName}</td>
        	</tr>
			<tr>
	        	<td>Father's Mobile No</td>
	        	<td>${parent.fatherMobNo}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Mobile No</td>
	        	<td>${parent.motherMobNo}</td>
        	</tr>
        	<tr>
	        	<td>Father's Email ID</td>
	        	<td>${parent.fatherEmail}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Email ID</td>
	        	<td>${parent.motherEmail}</td>
        	</tr>
        	<tr>
	        	<td>Father's Profession</td>
	        	<td>${parent.fatherProfession}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Profession</td>
	        	<td>${parent.motherProfession}</td>
        	</tr>
        	<tr>
	        	<td>Father's Salary</td>
	        	<td>${parent.fatherSalary}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Salary</td>
	        	<td>${parent.motherSalary}</td>
        	</tr>
        	<tr>
	        	<td>Father's Aadhar No</td>
	        	<td>${parent.fatherAadharNo}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Aadhar No</td>
	        	<td>${parent.motherAadharNo}</td>
        	</tr>
        	<tr>
	        	<td>Father's Qualification</td>
	        	<td>${parent.fatherQualification}</td>
        	</tr>
        	<tr>
	        	<td>Mother's Qualification</td>
	        	<td>${parent.motherQualification}</td>
        	</tr>
        	
        	</table>
        	
        
        </div>
        
        
</body>
</html>
