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
 * Servlet implementation class companymobile
 */
@WebServlet("/companymobile")
public class companymobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public companymobile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String number,operator;
		number=request.getParameter("no");
		operator=request.getParameter("op");
		
		PrintWriter out=response.getWriter();

		
		Connection con;
		PreparedStatement pst;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("insert into mobile(mnumber,moperator) values(?,?)");
			pst.setString(1, number);
			pst.setString(2, operator);
			int i=pst.executeUpdate();
			
			if(i>0)
			{
				//out.println("<h3 style='text-aline:center'>Number Added Sucessfully....</h3>");
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "Number Added Sucessfully...");
				response.sendRedirect("AddMobile.jsp");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		

	}

}
