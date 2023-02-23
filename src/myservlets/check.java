package myservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class check
 */
@WebServlet("/check")
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uid, psw;
		PrintWriter out=response.getWriter();
		uid=request.getParameter("unm");
		psw=request.getParameter("pws");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("select * from userpersonal where umobile=? and upassword=?");
			pst.setString(1, uid);
			pst.setString(2, psw);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				HttpSession ses=request.getSession();
				ses.setAttribute("userid", uid);
				
				String type=rs.getString("utype");
				if(type.equals("admin"))
					response.sendRedirect("Admin.jsp");
				else
					response.sendRedirect("User-Home.jsp");
			}
			else
			{
				// response.sendRedirect("Failure.jsp");
				
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "Incorrect Login & Password..");
				response.sendRedirect("login.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
	}

}
