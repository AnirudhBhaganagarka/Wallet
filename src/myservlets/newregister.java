package myservlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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
 * Servlet implementation class newregister
 */
@WebServlet("/newregister")
public class newregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newregister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String unm,psw,mail,mob,gender,city;
		
		InputStream inputStream = null;
		
		Part part=request.getPart("photo");	
		
		if (part != null)
		{
			inputStream = part.getInputStream();
		}
		
		
		
		
		
		unm=request.getParameter("nm");
		psw=request.getParameter("psw1");
		mail=request.getParameter("email");
		mob=request.getParameter("mob");
		gender=request.getParameter("gender");
		city=request.getParameter("city");
		
		
		PrintWriter out=response.getWriter();
		Connection con;
		PreparedStatement pst;
		
		try
		{
			
			String path = request.getRealPath("IMAGES") + File.separator + "userimages" + File.separator+part.getSubmittedFileName();
			
			
			FileOutputStream fos=new FileOutputStream(path);
			inputStream  = part.getInputStream();
			
			byte []data=new byte[inputStream.available()];
			
			inputStream.read(data);
			
			fos.write(data);
			
			fos.close();

			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("insert into userpersonal(uname,upassword,uemail,umobile,ugender,ucity,uprofile,utype,ustatus) values(?,?,?,?,?,?,?,default,default)");
			pst.setString(1, unm);
			pst.setString(2, psw);
			pst.setString(3, mail);
			pst.setString(4, mob);
			pst.setString(5, gender);
			pst.setString(6, city);
			
			if (inputStream != null)
			{
				pst.setString(7, part.getSubmittedFileName());
			}
			
			int i=pst.executeUpdate();
			
			if(i>0)
			{
				//out.println("<h3 style='text-aline:center'>User Registered Sucessfully....</h3>");
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "User Registered Sucessfully...");
				response.sendRedirect("Register.jsp");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		

		
	}

}
