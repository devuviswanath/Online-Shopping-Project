<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
		request.setAttribute("auth", auth);
	} else {
		response.sendRedirect("login.jsp");
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Payment Page</title>
</head>
<body>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Payment</div>
			<div class="card-body">
				<form action="payment-now" method="post">
					<div class="form-group">
						<label>name</label> <input type="text" name="name"
							class="form-control" placeholder="name" required>
					</div>
					<div class="form-group">
						<label>address</label>
						<textarea type="text" name="address" class="form-control"
							placeholder="Address" required></textarea>
					</div>
					<div class="form-group">
						<label>phone</label> <input type="number" name="phone"
							class="form-control" placeholder="Phone" required>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input type="radio" name="paymentMethod" value="COD"
								class="form-check-input" id="flexRadioDefault1" required>
							<label class="form-check-label" for="flexRadioDefault1">COD</label>
						</div>
						<div class="form-check">
							<input type="radio" name="paymentMethod" value="Debit/Credit"
								class="form-check-input" id="flexRadioDefault2" required>
							<label class="form-check-label" for="flexRadioDefault2">Debit/Credit</label>
						</div>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Pay</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>