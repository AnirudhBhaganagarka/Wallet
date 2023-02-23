package myservlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig

/**
 * Servlet implementation class kycDetails
 */
@WebServlet("/kycDetails")
public class kycDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kycDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

String wupi;


String anumber, umobile;



anumber=request.getParameter("no");
umobile=request.getParameter("umobile");

double bal=0.0;
wupi=umobile+"@sbi";	


InputStream inputStream = null;

Part part=request.getPart("photo");	

if (part != null)
{
	inputStream = part.getInputStream();
}



PrintWriter out=response.getWriter();


Connection con;
PreparedStatement pst;

try
{
	
	
	String path = request.getRealPath("IMAGES") + File.separator + "aadhar" + File.separator+part.getSubmittedFileName();
	
	
	FileOutputStream fos=new FileOutputStream(path);
	inputStream  = part.getInputStream();
	
	byte []data=new byte[inputStream.available()];
	
	inputStream.read(data);
	
	fos.write(data);
	
	fos.close();

	
	
	
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
	pst=con.prepareStatement("insert into kyc(waddhar,wbalance,wupi,umobile,wimg) values(?,?,?,?,?)");
	pst.setString(1, anumber);
	pst.setDouble(2, bal);
	pst.setString(3, wupi);
	pst.setString(4, umobile);

	if (inputStream != null)
	{
		pst.setString(5, part.getSubmittedFileName());
	}
	
	int i=pst.executeUpdate();
	
	if(i>0)
	{
		//out.println("<h3 style='text-aline:center'>KYC Complited Sucessfully....</h3>");
		HttpSession ses=request.getSession();
		ses.setAttribute("message", "KYC Complited Sucessfully....");
		response.sendRedirect("KYC.jsp");
	}
	
}
catch(Exception e)
{
	out.println(e);
}



		
	}

}
