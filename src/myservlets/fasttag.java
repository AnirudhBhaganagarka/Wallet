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

import mybeans.MyfastTag;

@MultipartConfig

/**
 * Servlet implementation class fasttag
 */
@WebServlet("/fasttag")
public class fasttag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fasttag() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String vnumber,pincode,addres,umobile;
		double amount,amt=0.0;
		
		
		vnumber=request.getParameter("vnm");
		pincode=request.getParameter("pcode");
		addres=request.getParameter("addres");
		amount=Double.parseDouble(request.getParameter("amt"));
		umobile=request.getParameter("umobile");
		PrintWriter out=response.getWriter();
		

		InputStream inputStream = null;
		
		Part part=request.getPart("photo");	
		
		if (part != null)
		{
			inputStream = part.getInputStream();
		}
		
		Connection con;
		PreparedStatement pst;
		
		 try
		 {
				String path = request.getRealPath("IMAGES") + File.separator + "rcimage" + File.separator+part.getSubmittedFileName();
				
				
				FileOutputStream fos=new FileOutputStream(path);
				inputStream  = part.getInputStream();
				
				byte []data=new byte[inputStream.available()];
				
				inputStream.read(data);
				
				fos.write(data);
				
				fos.close();
				
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
				pst=con.prepareStatement("insert into fasttag(fvehicle,fpin,faddres,fbalance,frc,umobile) values(?,?,?,?,?,?)");
				pst.setString(1, vnumber);
				pst.setString(2, pincode);
				pst.setString(3, addres);
				pst.setDouble(4, amt);
				if (inputStream != null)
				{
					pst.setString(5, part.getSubmittedFileName());
				}
				pst.setString(6, umobile);
				
				
				
				int i=pst.executeUpdate();
				
				if(i>0)
				{
					//out.println("<h3 style='text-aline:center'>FastTag Created Sucessfully....</h3>");
					
					MyfastTag obj=new MyfastTag();
					obj.setUmobile(umobile);
					obj.setAmount(amount);
					 String stat=obj.getStatus();
					 
					 if(stat.equals("success"))
						{

							pst=con.prepareStatement("insert into fasttagrecharge(famount,fdate,umobile) values(?,now(),?)");
							pst.setDouble(1, amount);
							pst.setString(2, umobile);
							
							int j=pst.executeUpdate();
							
							if(j>0)
							{
								//out.println("fastTag Created...");
								HttpSession ses=request.getSession();
								ses.setAttribute("message", "fastTag Recharged Sucessfully...");
								response.sendRedirect("FastTag.jsp");
							}
						}		 
					 
					 else
					 {
						 //out.println("Somethings went rong...");
						  HttpSession ses=request.getSession();
							ses.setAttribute("message", "Somethings went rong...");
							response.sendRedirect("FastTag.jsp");
					 }
				}
				
				
			}
			catch(Exception e)
			{
				out.println(e);
			}		
		
	}

}
