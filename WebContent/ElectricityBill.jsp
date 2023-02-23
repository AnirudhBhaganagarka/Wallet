<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mybeans.AmountBill" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electricity Bill</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>


<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">E-Wallet</a>
    <form class="d-flex">
            
     <a href="Logout.jsp" class="btn btn-outline-success" type="submit">Log Out</a> 
    </form>
  </div>
</nav>





<div class="container-fluid py-5">
<div class="container hi-5">
<%@ include file="Message.jsp" %>
<h3 style="text-align: center">Pay Electricity Bill</h3>
    <div class="container py-5">
    
    
    <form name="frm" method="post" action="electricity">

  	<div class="form-group row">
           <label class="col-sm-2 offset-sm-3 col-form-label">State</label>
           <div class="col-sm-4">
           <select id="type" name="state" class="form-control">
       		<option value="Maharashrta">Maharashrta</option>
       		<option value="Andhra Pradesh">Andhra Pradesh</option>
       		<option value="Assam">Assam</option>
       		<option value="Biharl">Bihar</option>
       		<option value="Goa">Goa</option>
       		<option value="Gujarat">Gujarat</option>
       		<option value="Jammu and Kashmir">Jammu and Kashmir</option>
       		<option value="Karnataka">Karnataka</option>
       		<option value="New Delhi">New Delhi</option>
       		<option value="West Bengal">West Bengal</option>
   		   </select>
           </div>
           </div>
           <div class="form-group row">
           <label class="col-sm-2 offset-sm-3 col-form-label">Electricity Board</label>
           <div class="col-sm-4">
           <select id="type" name="bord" class="form-control">
       		<option value="NTPC">NTPC</option>
       		<option value="Adani Group">Adani Group</option>
       		<option value="Tata Power">Tata Power</option>
       		<option value="JSW Energy">JSW Energy</option>
       		<option value="Torrent Power">Torrent Power</option>
       		<option value="MSPGCL">MSPGCL</option>
   		   </select>
           </div>
           </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Consumer Number</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="consumer" autocomplete="off" placeholder="Enter Consumer Number" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Billing Unit</label>
              <div class="col-sm-4">
                <input type="number" class="form-control" name="billing" autocomplete="off" placeholder="Enter Billing Unit" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Miter Uint</label>
              <div class="col-sm-4">
                <input type="number" class="form-control" name="miter" autocomplete="off" placeholder="Enter Miter Uint" required>
              </div>
			</div>
			
			              
            <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">Calculate Anount</button>
            </div>            

           <input type="text" class="form-control" name="umobile" value="<%=uid %>" readonly hidden > 
            
</form>

</div>
</div>
</div>
</body>
</html>

