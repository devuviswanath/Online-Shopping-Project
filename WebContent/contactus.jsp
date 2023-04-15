<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Page</title>
</head>

<body>

  <div class="container">
    <div class="card w-50 mx-auto my-5">
      <div class="card-header text-center">Contact Us</div>
      <div class="card-body">
        <form action="mailProcess.jsp" method="POST" />

          <div class="form-group">
            <label>Name</label> <input type="text" name="name" class="form-control" placeholder="Name" required>
          </div>
          <div class="form-group">
            <label>Email</label> <input type="email" name="email" class="form-control" placeholder="Email" required>
          </div>
          <div class="form-group">
            <label>Message</label> <textarea type="text" name="message" class="form-control" placeholder="Message" required></textarea>
          </div>

          <div class="text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>

        </form>


      </div>
    </div>
  </div>

</body>

	<%@include file="/includes/footer.jsp"%>

</html>