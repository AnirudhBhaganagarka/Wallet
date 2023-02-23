package myservlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class aduser
 */
@WebServlet("/aduser")
public class aduser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aduser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String number,status;
		PrintWriter out=response.getWriter();
		number=request.getParameter("no");
		status=request.getParameter("stat");
		
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
				pst=con.prepareStatement("update userpersonal set ustatus=? where umobile=?");
				pst.setString(1, status);
				pst.setString(2, number);
				int cnt=pst.executeUpdate();
				if(cnt>0)
				{
					//out.println("Save Changes..");
					HttpSession ses=request.getSession();
					ses.setAttribute("message", "Save Changes..");
					response.sendRedirect("ADUserID.jsp");
				}
				
				
			}
			else
			{
				//out.println("User Does't Exist..");
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "User Does't Exist..");
				response.sendRedirect("ADUserID.jsp");
			}
			
			
		}
		catch(Exception e)
		{
			out.println(e);
		}

	}

}
