<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tatal Transsfer</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>

<div class="container-fluid py-5">
<div class="container hi-5">
<h3 style="text-align: center">Tatal Transsfer</h3>
    <div class="container py-5">
    
    <table class="table table-bordered table-hover" style="text-align: center">
    <tr style="background-color:azure">
    <th>Cashback for
    <th>Amount
    <th>Date
    <th>To Mo.Number
    </tr>
    
<%
Connection con;
Statement st;
ResultSet rs;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	st=con.createStatement();
	rs=st.executeQuery("select * from cashback;");
	while(rs.next())
	{
		%>
		
		<tr>
		<td><%=rs.getString("cbtype") %>
		<td><%=rs.getString("cbamount") %>
		<td><%=rs.getString("cbdate") %>
		<td><%=rs.getString("umobile") %>
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