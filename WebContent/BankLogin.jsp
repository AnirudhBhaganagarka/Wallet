<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank Login</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/login.css">
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>



        <div class="container py-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                <%@ include file="Message.jsp" %>
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <h3>Bank Login Here..</h3>
                            <br>
                            
                        </div>
                        <div class="card-body">
                           <form name="frm" method="post" action="bankcheck">
                                <table>
                                        <tr>
                                            <td><label>UserID :-</label></td>
                                            <td><input type="text" name="unm" placeholder="Enter UID" required autocomplete="off"></td>
                                        </tr>
                                        <tr>
                                            <td><label>Password :-</label></td>
                                            <td><input type="password" name="pws" placeholder="Enter Password" required></td>
                                        </tr>
                                    </table>
                                    <button type="submit" class="btn btn-primary">Login</button> 
                                    <a href="#">Forgot Password ?</a> <br> 
                                    <a href="Register.html">Create New Account</a> 
                           </form>                        
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
</body>
</html>