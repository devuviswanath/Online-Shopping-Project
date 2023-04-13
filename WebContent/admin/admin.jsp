<%@page import="project.connection.ConnectionProvider"%>
<%@page import="project.Dao.*"%>
<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%

	ProductDao pd =new ProductDao(ConnectionProvider.getConnection());
	List<Product> products = pd.getAllProducts();
//cart badge	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list !=null){
		request.setAttribute("cart_list",cart_list);
	}
	
	%>

<!DOCTYPE html>
<html>
<head>
<title>Home page</title>

<%@include file="/admin/adminHeader.jsp"%>
<style type="text/css">
.grid-container {
  display: grid;
 grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
  padding: 8px;
  margin-right:auto;
}
.grid-item {
  margin: 1rem;
  height: 200px;
  border: 2px solid;
  padding: 20px;
  font-size: 30px;
  text-align: left;
}
</style>
</head>
<body>

	<div class="container">
		
		<div class="row">
		<%
		if(! products.isEmpty()){
			for(Product p:products)
			{%>
				<div class="grid-container">
				<div class="card w-100">
					<img class="grid-item" src="../product-image/<%= p.getImage() %>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName()%></h5>
						<h6 class="price">Price:$<%= p.getPrice()%></h6>
						<h6 class="category">Category:<%= p.getCategory() %> </h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="../delete-product?id=<%= p.getId() %>">Delete</a>
								
						</div>
					</div>
				</div>
			</div>
			
			<%}
		}%>


		</div>
	</div>

	<%@include file="/admin/adminFooter.jsp"%>
</body>
</html>