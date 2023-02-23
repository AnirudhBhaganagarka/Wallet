<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search UserID</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>


<div class="container-fluid py-5">
<div class="container hi-5">
<%@ include file="Message.jsp" %>
<h3 style="text-align: center">User Details KYC</h3>
    <div class="container py-5">
    
    
    <form name="frm" method="post" action="UserDetails.jsp">
            <div class="form-group row">
              <label class="col-sm-2 offset-sm-3 col-form-label">Mobile Number</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="no" autocomplete="off" placeholder="Enter Number" required>
              </div>
            </div>
            <div class="conatiner text-center">
                <button type="submit" class="btn btn-primary">Search User</button>
            </div>
    </form>
</div>
</div>
</div>

</body>
</html>