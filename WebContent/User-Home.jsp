<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/User.css">
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



<div class="container-fluid">
<div class="container">


<%

Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	
	pst=con.prepareStatement("select * from userpersonal where umobile=?");
	pst.setString(1, uid);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
		%>
		<div class="cbox py-5">
    <div class="container text-center ">
        <div class="row align-items-cente">
            <div class="col-sm-3 dbox"><img style="max-width:100px;" src="IMAGES/userimages/<%=rs.getString("uprofile")%>"></div>
            <div class="col-sm-9 dboc text-center" style="margin-top:4%"><h4><%=rs.getString("uname") %></h4>
            <br><a href="KYC.jsp">KYC Details</a>
            </div>
            </div>
          </div>
    </div>
		
		<%		
		
	}
}
catch(Exception e)
{
	out.println(e);
}




%>




<div class="row mt-3">
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	
  	<div class="container">
  	<a href="SendMoney.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/money.png"></a>
  	</div>
  	<br>
  	<h5>Send Money</h5>
  	</div>
  	</div>
  </div>
  
 <%
Connection co;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	co=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	
	pst=co.prepareStatement("select * from kyc where umobile=?");
	pst.setString(1, uid);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
%>	 
		
  
	<div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="BankLogin.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/salary.png"></a>
   	</div>
  	<h5>&#8377 <%=rs.getString("wbalance") %> </h5>
  	<h5>Wallet Balance</h5>
  	</div>
  	</div>
  </div>	
 <%
	}
	else
	{
		%>
		 <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/salary.png">
   	</div>
  	<h5>&#8377 0.0</h5>
  	<h5>Wallet Balance</h5>
  	</div>
  	</div>
  </div>	
 
		<%
	}
}
catch(Exception e)
{
	out.println(e);
}
 
 
 %>
 
 

  
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="Transaction.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/transaction.png"></a>
  	</div>
  	<br>
  	<h5>Your Transactions</h5>
  	</div>
  	</div>
  </div>
</div>





<div class="row mt-3">
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="MobileRecharge.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/mobile.png"></a>
  	</div>
  	<br>
  	<h5>Mobile Recharge</h5>
  	</div>
  	</div>
  </div>
  
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="ElectricityBill.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/electricity.png"></a>
  	</div>
  	<br>
  	<h5>Elctricity Bill</h5>
  	</div>
  	</div>
  </div>
  
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="FastTag.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/Fasttag.png"></a>
  	</div>
  	<br>
  	<h5>Fast Tag</h5>
  	</div>
  	</div>
  </div> 
</div>



</div>

</div>

</body>
</html>