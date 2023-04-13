<%@page import="project.connection.ConnectionProvider"%>
<%@page import="project.Dao.*"%>
<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("auth", auth);
	}

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(ConnectionProvider.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
	}
%>


<!DOCTYPE html>
<html>
<head>
<title>Cart Page</title>
<%@include file="/includes/header.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>

	<div class="container my-3">
		<div class="d-flex py-3">
			<table class="table table-light">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Quantity
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							Buy Now</th>
						<th scope="col">Cancel</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (cart_list != null && cart_list.size() > 0) {
							for (Cart c : cartProduct) {
					%>
					<tr>
						<td><%=c.getName()%></td>
						<td><%=c.getCategory()%></td>
						<td><%=c.getPrice()%></td>
						<td>
							<form action="order-now" method="post" class="form-inline">
								<input type="hidden" name="id" value="<%=c.getId()%>"
									class="form-input">
								<div class="form-group d-flex justify-content-between">
									<a class="btn btn-sm btn-decre"
										href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
										class="fas fa-minus-square"></i></a> <input type="text"
										name="quantity" class="form-control"
										value="<%=c.getQuantity()%>" readonly> <a
										class="btn bnt-sm btn-incre"
										href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
										class="fas fa-plus-square"></i></a>
								</div>
								<button type="submit" class="btn btn-primary btn-sm">Buy</button>
							</form>
						</td>
						<td><a href="remove-from-cart?id=<%=c.getId()%>"
							class="btn btn-sm btn-danger">Remove</a></td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
		</div>

		<div class="d-flex  p-2">
			<h3>Total Price:$ ${(total>0)?total:0}</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
		<%
			if (cart_list == null || cart_list.size() < 1) {
		%>

		<div class="text-center">
			<img class="rounded" src="product-image/cart-empty.png"
				alt="Card Empty">
		</div>
		<%
			}
		%>
	</div>


	
</body>
<%@include file="/includes/footer.jsp"%>
</html>