<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.EmployeeService"%>
<%@ page import="entity.Employee"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Update Employee</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	Employee e = (Employee) session.getAttribute("emp");
	if (e == null) {
		response.sendRedirect("login.jsp");
	}

	// Get the employee ID from the request parameter sent from the home page
	int empId = Integer.parseInt(request.getParameter("empId"));
	EmployeeService es = new EmployeeService();
	Employee emp = es.getEmployeeById(empId);

	if (emp != null) {
	%>

	<div class="container">
		<h2>Update Employee Details</h2>
		<form action="UpdateCtl" method="post">
			<div class="form-group">
				<label for="empId">Employee Id:</label> <input type="text"
					class="form-control" id="empId" name="empId"
					value="<%=emp.getEmpId()%>" readonly>
			</div>

			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" id="firstName" placeholder="Enter first name"
					name="firstName" value="<%=emp.getFirstName()%>">
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" id="lastName" placeholder="Enter last name"
					name="lastName" value="<%=emp.getLastName()%>">
			</div>
			<div class="form-group">
				<label for="salary">Salary:</label> <input type="text"
					class="form-control" id="salary" placeholder="Enter salary"
					name="salary" value="<%=emp.getSalary()%>">
			</div>
			<div class="form-group">
				<label for="usertName">User Name:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter user name"
					name="userName" value="<%=emp.getUserName()%>">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password" value="<%=emp.getPassword()%>">
			</div>
			<div class="form-group" style="display: inline-block;">
				<div class="form-group" style="display: inline-block;">
					<%
					if (!emp.isAdmin()) {
					%>
					<label for="isAdmin">Admin</label> <input type="radio"
						class="form-control" id="isAdmin" name="isAdmin" value="true">
					<label for="isNormalUser">Normal User:</label> <input type="radio"
						class="form-control" id="isNormalUser" name="isAdmin"
						value="false">
					<%
					} else {
					%>
					<label for="isAdmin"></label> <input type="hidden"
						class="form-control" id="isAdmin" name="isAdmin" value="true">
					<label for="isNormalUser"></label> <input type="hidden"
						class="form-control" id="isNormalUser" name="isAdmin"
						value="false">
					<%
					}
					%>
				</div>
			</div>
			<div>
				<button type="submit" class="btn btn-default" name="operation"
					value="update">Update</button>
			</div>
		</form>
	</div>
	<%
	} else {
	response.sendRedirect("login.jsp");
	}
	%>

</body>
</html>
