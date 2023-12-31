<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.EmployeeService"%>
<%@ page import="entity.Employee"%>
<%@ page import="java.util.List"%>
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

	<%!int lastEmpId = 0;%>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
	Employee e = (Employee) session.getAttribute("emp");
	if (e == null) {
		response.sendRedirect("login.jsp");
	}

	EmployeeService es = new EmployeeService();
	List<Employee> empList = es.getEmployee();
	Employee emp = empList.get(empList.size() - 1);
	lastEmpId = emp.getEmpId();

	if (emp != null) {
	%>

	<div class="container">
		<h2>Add Employee Details</h2>
		<form action="AddCtl" method="post">
			<div class="form-group">
				<label for="empId">Employee Id:</label> <input type="text"
					class="form-control" id="empId" name="empId"
					value="<%=lastEmpId + 1%>" readonly>
			</div>
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" id="firstName" placeholder="Enter first name"
					name="firstName" required>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" id="lastName" placeholder="Enter last name"
					name="lastName" required>
			</div>
			<div class="form-group">
				<label for="salary">Salary:</label> <input type="text"
					class="form-control" id="salary" placeholder="Enter salary"
					name="salary" required>
			</div>
			<div class="form-group">
				<label for="usertName">User Name:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter user name"
					name="userName" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password" required>
			</div>
			<div class="form-group" style="display: inline-block;">
				<label for="isAdmin">Admin</label> <input type="radio"
					class="form-control" id="isAdmin" name="isAdmin" value="true">
				<label for="isAdmin">Normal User:</label> <input type="radio"
					class="form-control" id="isAdmin" name="isAdmin" value="false">
			</div>
			<div>
				<button type="submit" class="btn btn-default" name="operation"
					value="add">Add</button>
			</div>
		</form>
	</div>
	<%
	}
	%>


</body>
</html>
