<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator</title>
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



<div class="container-fluid">
<div class="container">
<div class="row mt-3">
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="SearchUserID.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/search.png"></a>
  	</div>
  	<br>
  	<h5>Search userID</h5>
  	</div>
  	</div>
  </div>
  

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
		
	<div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="BankLogin.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/salary.png"></a>
   	</div>
  	<h5>&#8377 <%=rs.getString("wbalance") %></h5>
  	<h5 style=color:green;><%=rs.getString("wupi") %></h5>
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
  	<a href="Company.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/company.png"></a>
  	</div>
  	<br>
  	<h5>payment company</h5>
  	</div>
  	</div>
  </div>
</div>


<%
Statement st;
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");

st=con.createStatement();
rs=st.executeQuery("select count(*) from userpersonal;");
rs.next();
int count=rs.getInt(1);	
	%>
	<div class="row mt-3">
    <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<img style="max-width:100px;" class="img-fluid"  src="IMAGES/user.png">
  	</div>
  	<br>
  	<h5>Total Users</h5>
  	<h5 style=color:red;><%=count-1 %></h5>
  	</div>
  	</div>
  </div>
  <%
  
}
catch(Exception e)
{
	out.println(e);
}	

%>



<%

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");

st=con.createStatement();
rs=st.executeQuery("select count(*) from cashback;");
rs.next();
int count=rs.getInt(1);	
	%>
	 <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href="TotalTransfers.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/transaction.png"></a>
  	</div>
  	<br>
  	<h5>Total Transfers</h5>
  	<h5 style=color:blue;><%=count*50 %></h5>
  	</div>
  	</div>
  </div>
  
  <%
  
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
  	<a href="ShowAddedMoneyToWallet.jsp"><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/wallet.png"></a>
   	</div>
  	<br>
  	<h5>Total Money To Wallet</h5>
  	<br>
  	</div>
  	</div>
  </div> 
</div>


<div class="row mt-3">
  <div class="col-md-4">
  	<div class="card">
  	<div class="card-body text-center">
  	<div class="container">
  	<a href=ADUserID.jsp><img style="max-width:100px;" class="img-fluid" alt="" src="IMAGES/tasks.png"></a>
  	</div>
  	<br>
  	<h5>Activate / Deactivate UserID</h5>
  	</div>
  	</div>
  </div>  
</div>



</div>

</div>


</body>
</html>