
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="signupAction.jsp" method="post">
  <input type="text" name="name" placeholder="Enter your name" required>
  <input type="email" name="email" placeholder="Enter your email" required>
  <select name="securityQuestion" required>
  <option value="What is your favorite movie?">What is your favorite movie?</option>
  <option value="What was your favorite sport? ">What was your favorite sport? </option>
  <option value="What is your mother's maiden name?">What is your mother's maiden name? </option>
  <option value="In what city or town was your first job? ">In what city or town was your first job? </option>
  </select>
  <input type="text" name="answer" placeholder="Enter your Answer" required>
  <input type="password" name="password" placeholder="Enter Password" required>
  <input type="submit" value="signup">
  </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <% 
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
  %>
<h1>Successfully Updated</h1>
<% }%>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>