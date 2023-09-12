<%@ page import="service.EmployeeService"%>
<%@ page import="entity.Employee"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<%!Employee emp;%>

	<%
	emp = (Employee) session.getAttribute("emp");

	EmployeeService es = new EmployeeService();
	List<Employee> list = es.getEmployee();

	if (emp.isAdmin()) {
	%>


	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Salary</th>
					<th>Is Admin</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getEmpId()%></td>
					<td><%=list.get(i).getFirstName()%></td>
					<td><%=list.get(i).getLastName()%></td>
					<td><%=list.get(i).getSalary()%></td>
					<td><%=list.get(i).isAdmin()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%
	} else {
	%>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Salary</th>
					<th>Is Admin</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
				%>
				<%
				if (!list.get(i).isAdmin()) {
				%>
				<tr>
					<td><%=list.get(i).getEmpId()%></td>
					<td><%=list.get(i).getFirstName()%></td>
					<td><%=list.get(i).getLastName()%></td>
					<td><%=list.get(i).getSalary()%></td>
					<td><%=list.get(i).isAdmin()%></td>
				</tr>
				<%
				}
				%>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%
	}
	%>

</body>
</html>