
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if(auth!=null){
		request.setAttribute("auth",auth);
	}
	%>
	
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/header.jsp"%>
<title>About Us - ShoppingCart</title>
</head>
<body>
	<div class="container">
		<h1>About Us</h1>
		<p>Welcome to ShoppingCart! We are an online shopping platform
			that offers a wide range of products to suit your needs. Our goal is
			to provide our customers with high-quality products at competitive
			prices, along with excellent customer service.</p>
		<p>At ShoppingCart, we strive to make your online shopping
			experience enjoyable and convenient. Our website features a
			user-friendly interface, easy navigation, and secure payment options
			to ensure a safe and seamless shopping process. We also offer fast
			and reliable shipping to deliver your purchases right to your
			doorstep.</p>
		<div class="team">
			<div class="team-member">
				<h3>Devu Viswanath Suma</h3>
				<p>Co-founder & CEO</p>
			</div>
			<div class="team-member">
				<h3>Jain Joseph</h3>
				<p>Co-founder & CTO</p>
			</div>
			<div class="team-member">
				<h3>Alen Dominic</h3>
				<p>Chief Marketing Officer</p>
			</div>
		</div>
		<div class="footer">
			<p>Contact us: info@shoppingcart.com | Phone: 123-456-7890</p>
		</div>
	</div>
	
</body>
<%@include file="/includes/footer.jsp"%>
</html>