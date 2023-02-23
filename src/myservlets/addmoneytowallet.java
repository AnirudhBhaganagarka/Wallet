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

import mybeans.SendMoneyBankToWallet;

/**
 * Servlet implementation class addmoneytowallet
 */
@WebServlet("/addmoneytowallet")
public class addmoneytowallet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addmoneytowallet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String  fromacc,tupi,umobile;
		double amount;
		
		PrintWriter out=response.getWriter();
		fromacc=request.getParameter("accno");
		tupi=request.getParameter("toupi");
		umobile=request.getParameter("umobile");
		amount=Double.parseDouble(request.getParameter("amt"));
		
		Connection con;
		PreparedStatement pst;
				
		SendMoneyBankToWallet obj = new SendMoneyBankToWallet();
		obj.setFromacc(fromacc);
		obj.setTupi(tupi);
		obj.setUmobile(umobile);
		obj.setAmount(amount);
		String stat=obj.getStatus();
		
		if(stat.equals("success"))
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
				pst=con.prepareStatement("insert into sendmoney(msfrom,msto,msamount,msdate,umobile) values(?,?,?,now(),?)");
				pst.setString(1, fromacc);
				pst.setString(2, tupi);
				pst.setDouble(3, amount);
				pst.setString(4, umobile);
				int i=pst.executeUpdate();
				
				if(i>0)
				{
					//out.println("transaction Sucessful..");
					HttpSession ses=request.getSession();
					ses.setAttribute("message", "transaction Sucessful..");
					response.sendRedirect("AddMoneyToWallet.jsp");
				}
			
			}
			catch(Exception e)
			{
				out.println("e");
				
			}
		}
		else
		{
			//out.println("transaction faield..");
			HttpSession ses=request.getSession();
			ses.setAttribute("message", "transaction faield..");
			response.sendRedirect("AddMoneyToWallet.jsp");
		}
		
	}

}
