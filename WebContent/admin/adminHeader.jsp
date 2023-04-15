<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>

	<nav class="navbar navbar-expand-lg ">
		<div class="container">
			<a class="navbar-brand" href="admin.jsp">Shopping Cart</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="admin.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="adminAddProduct.jsp">Add Products</a></li>
					<li class="nav-item"><a class="nav-link" href="adminOrders.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="adminUsers.jsp">Users</a></li>
					<li class="nav-item"><a class="nav-link" href="../log-out">Logout</a></li>
					<li class="nav-item"><a class="nav-link" href="#">ADMIN</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>