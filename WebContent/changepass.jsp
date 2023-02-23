<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change password</title>
</head>
<body>
<%if(session.getAttribute("userid")==null)response.sendRedirect("login.jsp"); %>
<%String uid=String.valueOf(session.getAttribute("userid")); %>



<%
String number,oldpass,newpass;
number=uid;
oldpass=request.getParameter("oldno");
newpass=request.getParameter("newno");

Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	
	pst=con.prepareStatement("select * from userpersonal where umobile=? and upassword=?");
	pst.setString(1, number);
	pst.setString(2, oldpass);
	rs=pst.executeQuery();
	
	if(rs.next())
	{
		pst=con.prepareStatement("update userpersonal set upassword=? where umobile=?");
		pst.setString(1, newpass);
		pst.setString(2, number);
		
		int cnt=pst.executeUpdate();
		if(cnt>0)
		{
			//out.println("password Change Sucessfully..");
			HttpSession ses=request.getSession();
			ses.setAttribute("message", "password Change Sucessfully...");
			response.sendRedirect("ChangePassword.jsp");
		}
		
	}
	else
	{
	 	//out.println("Incurrect Old Password..");
		HttpSession ses=request.getSession();
		ses.setAttribute("message", "Incurrect Old Password...");
		response.sendRedirect("ChangePassword.jsp");
	}
}
catch(Exception e)
{
	out.println(e);	
}

%>
</body>
</html>