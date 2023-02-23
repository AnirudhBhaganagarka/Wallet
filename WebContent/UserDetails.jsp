<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    <%@page import ="javax.servlet.http.HttpSession" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>

<%
 String number;
number=request.getParameter("no");

Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	
	pst=con.prepareStatement("select * from userpersonal where umobile=?");
	pst.setString(1, number);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
		
		
		pst=con.prepareStatement("select userpersonal.uname,userpersonal.uemail,userpersonal.umobile,userpersonal.ugender,userpersonal.ucity,userpersonal.uprofile,userpersonal.ustatus,kyc.waddhar,kyc.wbalance,kyc.wupi,kyc.wimg from userpersonal inner join kyc on userpersonal.umobile=kyc.umobile where userpersonal.umobile=?");
		pst.setString(1, number);
		rs=pst.executeQuery();
		
		if(rs.next())
		{
			
			%>
			
			<div class="container-fluid py-5">
	        <div class="container hi-5">
	    
	    
	      <form name="frm" method="post" action=""  enctype="multipart/form-data">
	       
	       <div class="form-group row">
	            <div class="col-sm-4">
	            <img class="center" style="max-width:100px; text-align: center;"  alt="" src="IMAGES/userimages/<%=rs.getString("uprofile")%>">
	          </div>
	          </div>
	       
	          <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">User Name</label>
	              <div class="col-sm-4">
	                <input type="text" class="form-control" name="nm" value="<%=rs.getString("uname") %>" readonly>
	              </div>
	            </div>
	            
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">Email</label>
	              <div class="col-sm-4">
	                <input type="email" class="form-control" name="email" value="<%=rs.getString("uemail") %>" readonly>
	              </div>
	            </div>
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">Mobile No.</label>
	              <div class="col-sm-4">
	                <input type="text" class="form-control" name="mob" value="<%=rs.getString("umobile") %>" readonly>
	              </div>
	            </div>
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">Gender</label>
	              <div class="col-sm-4">
	                  <div class="form-check form-check-inline">
	                      <input class="form-check-input" type="radio" name="gender" value="<%=rs.getString("ugender") %>" checked>
	                      <label class="form-check-label" for="inlineRadio1">Male</label>
	                    </div>
	                    
	              </div>
	            </div>
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">City</label>
	              <div class="col-sm-4">
	                <input type="text" class="form-control" value="<%=rs.getString("ucity") %>" readonly>
	              </div>
	            </div>
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">User Status</label>
	              <div class="col-sm-4">
	                <input type="text" class="form-control" value="<%=rs.getString("ustatus") %>" readonly>
	              </div>
	            </div>
	            
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">Aadhar Number</label>
	              <div class="col-sm-4">
	                <input type="text" class="form-control" name="nm" value="<%=rs.getString("waddhar") %>" readonly>
	              </div>
	            </div>
	            
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">Wallet UPI-ID</label>
	              <div class="col-sm-4">
	                <input type="email" class="form-control" name="email" value="<%=rs.getString("wupi") %>" readonly>
	              </div>
	            </div>
	            <div class="form-group row">
	              <label class="col-sm-2 offset-sm-3 col-form-label">Wallet Balance</label>
	              <div class="col-sm-4">
	                <input type="text" class="form-control" name="mob" value="<%=rs.getString("wbalance") %>" readonly>
	              </div>
	            </div>
	           
	      </form>
	    </div>


	  </div>
	
	  

	  
	  
			
			
			
			
			
			<%
		
		}		
		
	}
	else
	{
		//out.println("user Does'n Exist..");
		HttpSession ses=request.getSession();
		ses.setAttribute("message", "user Does'n Exist..");
		response.sendRedirect("UserDetails.jsp");
	}
}
catch(Exception e)
{
	out.println(e);
}



%>



</body>
</html>