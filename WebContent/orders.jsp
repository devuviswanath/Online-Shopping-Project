<%@page import="java.text.DecimalFormat"%>
<%@page import="project.connection.ConnectionProvider"%>
<%@page import="project.model.*"%>
<%@page import="project.Dao.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if(auth!=null){
		request.setAttribute("auth",auth);
		orders = new OrderDao(ConnectionProvider.getConnection()).userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	
	//cart badge	
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
		if(cart_list !=null){
			request.setAttribute("cart_list",cart_list);
		}
	%>


<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/header.jsp"%>
<title>Order Page</title>
</head>
<body>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity() %></td>
						<td><%=o.getPrice() %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			</tbody>
		</table>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>