package myservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class companyelectricity
 */
@WebServlet("/companyelectricity")
public class companyelectricity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public companyelectricity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String State,eb,cn,bu;
		State=request.getParameter("State");
		eb=request.getParameter("eb");
		cn=request.getParameter("cn");
		bu=request.getParameter("bu");
		
		PrintWriter out= response.getWriter();
		
		Connection con;
		PreparedStatement pst;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("insert into electricityboard(state,provider,consumer,billingunit) values(?,?,?,?)");
			pst.setString(1, State);
			pst.setString(2, eb);
			pst.setString(3, cn);
			pst.setString(4, bu);
			int i=pst.executeUpdate();
			
			if(i>0)
			{
				//out.println("<h3 style='text-aline:center'>Number Added Sucessfully....</h3>");
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "Company Added Sucessfully...");
				response.sendRedirect("AddElectricityBoard.jsp");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}

	}

}
