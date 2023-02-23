<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    <%@page import="java.io.InputStream" %>
    
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.servlet.http.Part" %>
<%@page import="javax.servlet.annotation.MultipartConfig" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>
<%

String aphoto, wupi;
double bal=0.0;
wupi=uid+"@sbi";

String anumber, picture;

InputStream inputStream = null;



anumber=request.getParameter("no");

Part filePart = request.getPart("photo");
if (filePart != null) 
{
	inputStream = filePart.getInputStream();
}


Connection con;
PreparedStatement pst;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	pst=con.prepareStatement("insert into kyc(waddhar,wimage,wbalance,wupi,umobile) values(?,?,?,?,?)");
	pst.setString(1, anumber);
	
	if (inputStream != null)
	{
		pst.setBlob(2, inputStream);
	}
	
	pst.setDouble(3, bal);
	pst.setString(4, wupi);
	pst.setString(5, uid);
	
	int i=pst.executeUpdate();
	
	if(i>0)
	{
		out.println("<h3 style='text-aline:center'>KYC Complited Sucessfully....</h3>");
	}
	
}
catch(Exception e)
{
	out.println(e);
}



%>



</body>
</html>