package myservlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.MobileRecharge;
import mybeans.SendEmail;

import java.sql.*;


/**
 * Servlet implementation class recharge
 */
@WebServlet("/recharge")
public class recharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recharge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String umobile,number,operator;
		double amount;
		PrintWriter out=response.getWriter();
		
		umobile=request.getParameter("umobile");
		number=request.getParameter("no");
		operator=request.getParameter("op");
		amount=Double.parseDouble(request.getParameter("amt"));
		
		String subj;
		String msg;
		String frm;
		String too;
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("select * from mobile where mnumber=? and moperator=?");
			pst.setString(1, number);
			pst.setString(2, operator);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				
				MobileRecharge obj= new MobileRecharge();
				
				obj.setNumber(number);
				obj.setOperator(operator);
				obj.setUmobile(umobile);
				obj.setAmount(amount);
				String stat=obj.getStatus();
				
				if(stat.equals("success"))
				{
					subj="Mobile Recharge";
					msg="Your Amount Is:-" + amount;
					frm="myonlinewallet01@gmail.com";
					too="apbanirudh@gmail.com";
					
					SendEmail se = new SendEmail();
					se.setFrom(frm);
					se.setTo(too);
					se.setSubject(subj);
					se.setMessage(msg);
					
					se.getStatus();
					
					// out.println("Recharge Sucessfully...");
					HttpSession ses=request.getSession();
					ses.setAttribute("message", "Recharge Sucessfully...");
					response.sendRedirect("MobileRecharge.jsp");
				}
						
				else
				{
					// out.println("Insuficient balence...");
					HttpSession ses=request.getSession();
					ses.setAttribute("message", "Insuficient balence...");
					response.sendRedirect("MobileRecharge.jsp");
				}
				
				
				
			}
			else
			{
				// out.println("Your Number or Operator is wrong");
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "Your Number or Operator is wrong");
				response.sendRedirect("MobileRecharge.jsp");
			}
			
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
		
	}

}
