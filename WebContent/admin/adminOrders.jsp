<%@page import="java.text.DecimalFormat"%>
<%@page import="project.connection.ConnectionProvider"%>
<%@page import="project.model.*"%>
<%@page import="project.Dao.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

OrderDao pd =new OrderDao(ConnectionProvider.getConnection());
List<Order> orders = pd.getAllOrders();

%>


<!DOCTYPE html>
<html>
<head>
<%@include file="/admin/adminHeader.jsp"%>
<title>Order Page</title>
<style type="text/css">
body{
	min-height:100px;
	display:flex;
	flex-direction:column;
}
</style>

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
				</tr>
			</thead>
			<tbody>
				<%
					if (orders != null) {
						for (Order o : orders) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=o.getPrice()%></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</div>
</body>
<%@include file="/admin/adminFooter.jsp"%>
</html>