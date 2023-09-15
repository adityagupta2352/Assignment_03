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

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	Employee emp = (Employee) session.getAttribute("emp");
	if (emp == null) {
		response.sendRedirect("login.jsp");
	}

	if (emp != null) {
		EmployeeService es = new EmployeeService();
		List<Employee> list = es.getEmployee();

		if (emp.isAdmin()) {
	%>
	<div class="container">
		<table class="table">
			<h2 style="text-align: center;">Employee Details</h2>
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Salary</th>
					<th>Is Admin</th>
					<th>Deletion</th>
					<th>Updation</th>
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
					<%
					if (list.get(i).isAdmin()) {
					%>
					<td><button style="background-color: yellow;" type="submit"
							name="deleteData" value="deletion" disabled>Delete
							Employee</button></td>
					<%
					} else {
					%>
					<td><button style="background-color: light-blue;"
							type="submit" name="deleteData" value="deletion">
							<a href="DeleteCtl?empId=<%=list.get(i).getEmpId()%>">Delete
								Employee </a>
						</button></td>
					<%
					}
					%>
					<td><button type="submit" name="updateData" value="updation">
							<a href="update.jsp?empId=<%=list.get(i).getEmpId()%>">Update
								Employee</a>
						</button></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<button type="submit" name="addData" value="addition">
			<a href="add.jsp">Add Employee</a>
		</button>
		<button type="submit" name="logout" value="logout">
			<a href="LoginCtl">LogOut</a>
		</button>
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
				<tr>
					<td><%=emp.getEmpId()%></td>
					<td><%=emp.getFirstName()%></td>
					<td><%=emp.getLastName()%></td>
					<td><%=emp.getSalary()%></td>
					<td><%=emp.isAdmin()%></td>
					<td><button type="submit" name="updateData" value="updation">
							<a href="normalUpdate.jsp?empId=<%=emp.getEmpId()%>">Update
								Employee</a>
						</button></td>
				</tr>
			</tbody>
		</table>
		<button type="submit" name="back" value="back">
			<a href="LoginCtl">Back</a>
		</button>
	</div>
	<%
	}
	}
	%>

</body>
</html>
