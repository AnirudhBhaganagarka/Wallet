<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Electricity Board</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>


<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">E-Wallet</a>
    <form class="d-flex">
      
      <a  href="ChangePassword.jsp" class="navbar-brand">Change Password</a>
     <a href="Logout.jsp" class="btn btn-outline-success" type="submit">Log Out</a> 
    </form>
  </div>
</nav>

<div class="container-fluid py-5">
<div class="container hi-5">
<%@ include file="Message.jsp" %>
<h3 style="text-align: center">ADD Electricity Company</h3>
    <div class="container py-5">
    
    <form name="frm" method="post" action="companyelectricity">
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">State</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="State" autocomplete="off" placeholder="Enter Number" required>
              </div>
            </div>
           <div class="form-group row">
           <label class="col-sm-2 offset-sm-3 col-form-label">Electricity Board</label>
           <div class="col-sm-4">
           <input type="text" class="form-control" name="eb" autocomplete="off" placeholder="Enter Number" required>
           </div>
           </div>
           <div class="form-group row">
           <label class="col-sm-2 offset-sm-3 col-form-label">Consumer Number</label>
           <div class="col-sm-4">
           <input type="text" class="form-control" name="cn" autocomplete="off" placeholder="Enter Number" required>
           </div>
           </div>
           <div class="form-group row">
           <label class="col-sm-2 offset-sm-3 col-form-label">Billing Unit</label>
           <div class="col-sm-4">
           <input type="text" class="form-control" name="bu" autocomplete="off" placeholder="Enter Number" required>
           </div>
           </div>
           <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">ADD Company</button>
            </div>
	</form>
	</div>
	</div>
	</div>



</body>
</html>