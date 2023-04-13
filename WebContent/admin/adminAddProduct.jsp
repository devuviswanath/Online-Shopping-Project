<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<%@include file="/admin/adminHeader.jsp"%>
<title>Add Product Page</title>

</head>
<body>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">ADD PRODUCTS</div>
			<div class="card-body">
				<form action="../add-product" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input class="form-control" type="text" name="name"
							placeholder="Product name" required>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="category"
							placeholder="Category" required>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="price"
							placeholder="Price" required>
					</div>
					
					<div class="form-group">
						<input class="form-control" type="file" name="file"
							 required>
					</div>
					
					
					<div class="text-center">
						<button type="submit" value="ok" class="btn btn-primary">OK</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/admin/adminFooter.jsp"%>
</body>
</html>