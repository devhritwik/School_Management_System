<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url var="style" value="/style" />
<html>

<link rel="stylesheet" type="text/css" href="${style}/bootstrap/css/bootstrap.min.css" /><head>
<script src="${style}/bootstrap/js/bootstrap.min.js"></script>
<script src="${style}/bootstrap/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${style}/css/login.css" />

<head>
<title>Login</title>
<style>
.errorblock {
	color: #ff0000;
}
</style>
</head>

<body onload='document.loginForm.j_username.focus();'>

	<div class="knockout">First Step Senior Secondary School</div>
	
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-heading">
				<h2 class="text-center">Login to enter</h2>
			</div>
			
			<hr />
			<div class="modal-body">
			<%
				String errorString = (String) request.getAttribute("error");
				if (errorString != null && errorString.trim().equals("true")) {
					out.println("<span class=\"errorblock\">Incorrect login name or password. Please try again");
				}
			%>
				<form name='loginForm' action="<c:url value='login' />" method='POST'>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-user"></span>
							</span>
							<input type='text' name='username' class="form-control" placeholder="Username" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-lock"></span>
							</span>
							<input type='password' name='password' class="form-control" placeholder="Password" />
						</div>

					</div>
					
					<div class="form-group text-center">
						<button name="submit" type="submit" value="Submit" class="btn btn-success btn-lg">Submit</button>
						<button name="reset" type="reset" value="Reset" class="btn btn-success btn-lg">Reset</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

</body>
</html>