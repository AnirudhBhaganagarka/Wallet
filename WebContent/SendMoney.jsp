<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send Money</title>
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
<h3 style="text-align: center">Send Money To Friend</h3>
    <div class="container py-5">
<%
Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	
	pst=con.prepareStatement("select * from kyc where umobile=?");
	pst.setString(1, uid);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
%>

		  <form method="post" action="sendmoney">
    		<div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Your Wallet-UPI</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="fromupi" value="<%=rs.getString("wupi") %>" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Your Balance</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="yourbal" value="<%=rs.getString("wbalance") %>" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Wallet-UPI</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="toupi" autocomplete="off" placeholder="Enter UPI" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Amount</label>
              <div class="col-sm-4">
                <input type="number" class="form-control" name="amt" size="15" autocomplete="off" placeholder="&#8377 Enter Amount" required>
              </div>
              </div>
              <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">Send Money</button>
            </div>
    
    		<input type="text" class="form-control" name="umobile" value="<%=uid%>" readonly hidden>
    		
    </form>
  

<%
	
	}
}
catch(Exception e)
{
	out.println(e);
}



%>    
    
    </div>
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</body>
</html>