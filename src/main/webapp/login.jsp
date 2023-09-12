<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!String msg;%>
	<%
	msg = (String) request.getAttribute("msg");

	if (msg != null) {
	%>
	<div>
		<%=msg%>
	</div>
	<%
	}
	%>


	<div class="container">
		<h2>Vertical (basic) form</h2>
		<form action="LoginCtl" method="post">
			<div class="form-group">
				<label for="userName">User Name:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter name"
					name="userName">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password">
			</div>
			<button type="submit" class="btn btn-default" name="operation"
				value="login">Login</button>
		</form>
	</div>
</body>
</html>