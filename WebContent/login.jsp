<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@page import="project.connection.ConnectionProvider"%>
<%@page import="project.Dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	//cart badge	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/header.jsp"%>
<title>Login Page</title>
</head>
<body>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email address</label> <input type="email" name="email"
							class="form-control" placeholder="Enter email" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password" name="password"
							class="form-control" placeholder="Password" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
					
					<div>
						<ul class="list-unstyled">
							<li><a href="forgotPassword.jsp">Forgot Password</a></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>