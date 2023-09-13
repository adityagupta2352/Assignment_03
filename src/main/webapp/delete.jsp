<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h2>Delete Employee Details</h2>
		<form action="DeleteCtl" method="post">
			<div class="form-group">
				<label for="empId">Employee Id:</label> <input type="text"
					class="form-control" id="empId" placeholder="Enter Id" name="empId" required>
			</div>
			<button type="submit" class="btn btn-default" name="operation"
				value="delete">Delete</button>
		</form>
	</div>

	</from>

</body>
</html>