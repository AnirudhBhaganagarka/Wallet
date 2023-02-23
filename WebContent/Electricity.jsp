<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electricity.jsp</title>
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


<%
String state = (String)session.getAttribute("state");
String board = (String)session.getAttribute("board");
String consumern = (String)session.getAttribute("consumern");
String billingu = (String)session.getAttribute("billingu");
int miteru = (Integer)session.getAttribute("miteru");
double amount = (Double)session.getAttribute("amount");
if(amount>0.0)
{
%>

<div class="container-fluid py-5">
<div class="container hi-5">
<%@ include file="Message.jsp" %>
<h3 style="text-align: center">Pay Electricity Bill</h3>
    <div class="container py-5">
    <form name="frm" method="post" action="electricitypay">

          <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">State</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="state" value="<%=state %>" readonly required>
              </div>
            </div>
           <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Electricity Board</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="bord" value="<%=board %>" readonly required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Consumer Number</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="consumer" value="<%=consumern %>" readonly required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Billing Unit</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="billing" value="<%=billingu %>" readonly >
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Miter Uint</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="miter" value="<%=miteru %>" readonly required>
              </div>
			</div>
			
			<div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Amount</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="amt" size="15" value="<%=amount %>"  required>
              </div>
              </div>
   	
              
            <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">Pay Now</button>
            </div>            
 

	<input type="text" class="form-control" name="umobile" value="<%=uid %>" readonly hidden >
            
</form>

</div>
</div>
</div>	
<%
}
else
{
	
}
%>

</body>
</html>