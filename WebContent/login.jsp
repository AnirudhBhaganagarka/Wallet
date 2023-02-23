<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>LogIn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/bootstrap.min.js">
    <link rel="stylesheet" href="CSS/login.css">
</head>
<body>

<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">E-Wallet</a>
    <form class="d-flex">
    </form>
  </div>
</nav>


<div class="container">
<%@ include file="Message.jsp" %>
</div>
      <div class="Loginbox">
      
	
      
      <h1>Login Here</h1>
      <form name="login" method="post" action="check">
           <p>UserID</p>
           <input type="text" name="unm" placeholder="Enter Number" required>
           <p>Password</p>
           <input type="Password" name="pws" placeholder="Enter Password" required>
           <input type="submit" name="sub" value="LogIn">
           <a href="RecoverPassword.jsp">Forgot your password?</a><br>
           <a href="Register.jsp">Create a new account</a>
            
      </form>


     </div>

</body>
</html>