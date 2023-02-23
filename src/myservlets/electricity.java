package myservlets;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.PayElectricity;



/**
 * Servlet implementation class electricity
 */
@WebServlet("/electricity")
public class electricity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public electricity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String state,board,consumern,billingu;
		int miteru;
		double amount;
		PrintWriter out= response.getWriter();
		
		state=request.getParameter("state");
		board=request.getParameter("bord");
		consumern=request.getParameter("consumer");
		billingu=request.getParameter("billing");
		miteru=Integer.parseInt(request.getParameter("miter"));
		

		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("select * from electricityboard where state=? and provider=? and consumer=? and billingunit=?");
			pst.setString(1, state);
			pst.setString(2, board);
			pst.setString(3, consumern);
			pst.setString(4, billingu);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				PayElectricity obj = new PayElectricity();
				obj.setMiteru(miteru);
				amount=obj.getTotalamt();
				String stat=obj.getStatus();
				
				if(stat.equals("success"))
				{
					//out.println(amount);
					HttpSession ses=request.getSession();
					ses.setAttribute("state", state);
					ses.setAttribute("board", board);
					ses.setAttribute("consumern", consumern);
					ses.setAttribute("billingu", billingu);
					ses.setAttribute("miteru", miteru);
					ses.setAttribute("amount", amount);
					response.sendRedirect("Electricity.jsp");
				}	

				
			}
			else
			{
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "Deatails are rong..");
				response.sendRedirect("ElectricityBill.jsp");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
		
			}

}
