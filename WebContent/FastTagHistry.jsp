<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fast Tag</title>
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
<h3 style="text-align: center">Send Money Transactions</h3>
    <div class="container py-5">
    
    <table class="table table-bordered table-hover" style="text-align: center">
    <tr style="background-color:azure">
    <th>Date
    <th>Amount
    </tr>
    
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	pst=con.prepareStatement("select * from fasttagrecharge where umobile=?");
	pst.setString(1, uid);
	rs=pst.executeQuery();
		
	while(rs.next())
	{
		%>
		
		<tr>
		<td><%=rs.getDate("fdate") %>
		<td><%=rs.getString("famount") %>
		</tr>
		
		
		<%
	}
	con.close();
		
}
catch(Exception e)
{
	out.println(e);	
}



%>    
    
    
    </table>
    
</div>
</div>
</div>

</body>
</html>