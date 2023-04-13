<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
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
<link rel="stylesheet" href="css/style.css">
<%@include file="/includes/header.jsp"%>
<title>Signup Page</title>

</head>
<body>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">SignUp</div>
			<div class="card-body">
				<form action="sign-up" method="post">
					<div class="form-group">
						<input class="form-control" type="text" name="name"
							placeholder="Enter your name" required>
					</div>
					<div class="form-group">
						<input class="form-control" type="email" name="email"
							placeholder="Enter your email" required>
					</div>
					<div class="form-group">
						<select class="form-control" name="securityQuestion" required>
							<option value="What is your favorite movie?">What is
								your favorite movie?</option>
							<option value="What was your favorite sport? ">What was
								your favorite sport?</option>
							<option value="What is your mother's maiden name?">What
								is your mother's maiden name?</option>
							<option value="In what city or town was your first job? ">In
								what city or town was your first job?</option>
						</select>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="answer"
							placeholder="Enter your Answer" required>
					</div>
					<div class="form-group">
						<input class="form-control" type="password" name="password"
							placeholder="Enter Password" required>
					</div>
					<div class="text-center">
						<button type="submit" value="signup" class="btn btn-primary">SignUp</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>