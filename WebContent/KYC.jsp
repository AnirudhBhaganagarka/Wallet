<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>KYC Details</title>
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
	pst=con.prepareStatement("select * from kyc where umobile=?");
	pst.setString(1, uid);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
		
		%>
		
		<div class="container-fluid py-5">
<div class="container">
<h3 style="text-align: center">KYC Details</h3>
    <div class="container py-5">
      <form name="frm" method="post" action="">
       <div class="form-group row">
          <label class="col-sm-2 offset-sm-3 col-form-label"></label>
          <div class="col-sm-4">
            <img class="center" style="max-width:100px; text-align: center;"  alt="" src="IMAGES/aadhar/<%=rs.getString("wimg")%>">
          </div>
          </div>
       <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Aadhar Number</label>
              <div class="col-sm-4">
                <input type="text" name="no" class="form-control" size="15" value="<%=rs.getString("waddhar") %>" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Your Wallet-UPI-ID</label>
              <div class="col-sm-4">
                <input type="text" name="no" class="form-control" size="15" value="<%=rs.getString("wupi") %>" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Your Number</label>
              <div class="col-sm-4">
                <input type="text" name="no" class="form-control" size="15" value="<%=rs.getString("umobile") %>" readonly>
              </div>
            </div>   

            <div class="conatiner text-center">
                <input type="submit" value="submit" class="btn btn-primary"/>
            </div>
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
<div class="container">
<%@ include file="Message.jsp" %>
<h3 style="text-align: center">KYC Details</h3>
    <div class="container py-5">
      <form name="frm" method="post" action="kycDetails" enctype="multipart/form-data">
       <div class="form-group row">
          <label class="col-sm-2 offset-sm-3 col-form-label">Upload Aadhar</label>
          <div class="col-sm-4">
            <input type="file" name="photo" autocomplete="off">
          </div>
          </div>
       <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Aadhar Number</label>
              <div class="col-sm-4">
                <input type="text" name="no" class="form-control" size="15" placeholder="Enter Number" required>
              </div>
            </div>   

            <div class="conatiner text-center">
                <input type="submit" value="submit" class="btn btn-primary"/>
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