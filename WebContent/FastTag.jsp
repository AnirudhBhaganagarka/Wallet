<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FastTag</title>
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
Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	pst=con.prepareStatement("select * from fasttag where umobile=?");
	pst.setString(1, uid);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
		%>
		
<div class="container-fluid py-5">
<div class="container hi-5">
<h3 style="text-align: center">FastTag</h3>
<div class="container py-5">


<form name="frm" method="post" action="User-Home.jsp" enctype="multipart/form-data">
       <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Vehicle Number</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="vnm" value="<%=rs.getString("fvehicle") %>" readonly>
              </div>
            </div>
      
          <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Pin Code</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pcode" value="<%=rs.getString("fpin") %>" readonly>
              </div>
            </div>
          <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Addres</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="addres" value="<%=rs.getString("faddres") %>" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Amount</label>
              <div class="col-sm-4">
                <input type="number" class="form-control" name="amt" size="15" value="<%=rs.getDouble("fbalance") %>" readonly>
              </div>
            </div>
            
             <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">OK</button>
            </div>
            
            
            <input type="text" class="form-control" name="umobile" value="<%=uid%>" readonly hidden>
            
    </form>


</div>
</div>
</div>
		
		
		
		<%
		
	}
	else
	{
		%>
		
<div class="container-fluid py-5">
<div class="container hi-5">
<%@ include file="Message.jsp" %>
<h3 style="text-align: center">FastTag</h3>
<div class="container py-5">

	<form name="frm" method="post" action="fasttag" enctype="multipart/form-data">
       <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Vehicle Number</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="vnm" autocomplete="off" placeholder="Enter Name" required>
              </div>
            </div>
       <div class="form-group row">
          <label class="col-sm-2 offset-sm-3 col-form-label">Upload RC</label>
          <div class="col-sm-4">
            <input type="file" name="photo" autocomplete="off">
          </div>
          </div>
          <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Pin Code</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pcode" autocomplete="off" placeholder="Enter Name" required>
              </div>
            </div>
          <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Addres</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="addres" autocomplete="off" placeholder="Enter Name" required>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Amount</label>
              <div class="col-sm-4">
                <input type="number" class="form-control" name="amt" size="15" value="500.0" readonly required>
              </div>
            </div>
            
             <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">Order FastTag</button>
            </div>
            
            
            <input type="text" class="form-control" name="umobile" value="<%=uid%>" readonly hidden>
            
    </form>



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
</body>
</html>