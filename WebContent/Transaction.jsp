<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transactions</title>
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
<h3 style="text-align: center">Your Transaction</h3>
    <div class="container py-5">
    
    <a href="ShowAddedMoneyToWallet.jsp">Money Added To Wallet</a>
    <br>
    <a href="SendHistry.jsp">Send Money</a>
    <br>
    <a href="MobileHistry.jsp">Mobile Recharge</a>
    <br>
    <a href="Electricityhistry.jsp">Elctricity Bill</a>
    <br>
    <a href="FastTagHistry.jsp">Fast Tag</a>
    <br>
    <a href="Cashback.jsp">CashBack</a>
    

</div>
</div>
</div>
</body>
</html>