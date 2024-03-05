<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Display All</title>
</head>
<body>
	<div class="container">

		<h1>Employee CURD Operations</h1>
		
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" aria-current="page" href="./addEmpForm">Add Employee</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="./displayAll">View All Employees</a>
		  </li>
		</ul>
		
		<div class="container">
			<table class="table table-striped">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Date Of Birth</th>
					<th>Age</th>
					<th>Salary</th>
					<th>Status</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${ allEmployees }" var="emp">
					<tr>
						<td>${emp.id }</td>
						<td>${emp.name }</td>
						<td>${emp.email }</td>
						<td>${emp.dob }</td>
						<td>${emp.age }</td>
						<td>${emp.salary }</td>
						<td>${emp.status }</td>
						<td><a href="./edit/${emp.id }">edit</a></td>
						<td><a href="./delete/${emp.id }">delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>


	</div>
</body>
</html>