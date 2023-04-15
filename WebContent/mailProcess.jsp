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
      <div class="card-header text-center">Contact Form Validation</div>
      <div class="card-body">
        
            <h1>Contact Form Submission</h1>
    <%
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Validate form data
        boolean isValid = true;
        String errorMessage = "";
        if (name == null || name.isEmpty()) {
            isValid = false;
            errorMessage += "Name is required.<br>";
        }
        if (email == null || email.isEmpty()) {
            isValid = false;
            errorMessage += "Email is required.<br>";
        } else if (!email.matches("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\\b")) {
            isValid = false;
            errorMessage += "Invalid email address.<br>";
        }
        if (message == null || message.isEmpty()) {
            isValid = false;
            errorMessage += "Message is required.<br>";
        }

        // If form data is valid, send email or perform other actions
        if (isValid) {
            // Perform action, e.g., send email
            out.println("<p>Thank you for your submission!</p>");
        } else {
            // Display error messages
            out.println("<p style='color: red;'>" + errorMessage + "</p>");
            out.println("<p><a href='contact.jsp'>Go back</a></p>");
        }
    %>

      </div>
    </div>
  </div>

</body>

	<%@include file="/includes/footer.jsp"%>

</html>