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

UserDao ud =new UserDao(ConnectionProvider.getConnection());
List<User> users = ud.getAllUser();

%>


<!DOCTYPE html>
<html>
<head>
<%@include file="/admin/adminHeader.jsp"%>
<title>Users Page</title>
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
		<div class="card-header my-3">All Users</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (users != null) {
						for (User u : users) {
				if(!"admin@gmail.com".equals(u.getEmail())){ %>
				<tr>
					<td><%=u.getName()%></td>
					<td><%=u.getEmail()%></td>
					<td>
					
					<a class="btn btn-sm btn-danger"
						href="../delete-user?id=<%=u.getId()%>">Delete User</a>
						
						</td>
						
				</tr>
				<% }
					}
					}
				%>
			</tbody>
		</table>
	</div>
</body>
<%@include file="/admin/adminFooter.jsp"%>
</html>