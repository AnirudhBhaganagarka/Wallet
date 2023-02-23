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

import mybeans.SendEmail;
import mybeans.SendUpiMoney;

/**
 * Servlet implementation class sendmoney
 */
@WebServlet("/sendmoney")
public class sendmoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendmoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String  fupi,tupi,umobile;
		double amount;
		
		PrintWriter out=response.getWriter();
		fupi=request.getParameter("fromupi");
		tupi=request.getParameter("toupi");
		umobile=request.getParameter("umobile");
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
			pst=con.prepareStatement("select * from kyc where wupi=?");
			pst.setString(1, tupi);
			rs=pst.executeQuery();
						
			if(rs.next())
			{
				SendUpiMoney obj= new SendUpiMoney();
				
				obj.setFupi(fupi);
				obj.setTupi(tupi);
				obj.setAmount(amount);
				String stat=obj.getStatus();
				
				if(stat.equals("success"))
				{
					
					subj="Upi transaction";
					msg="Your Amount Is:-" + amount;
					frm="myonlinewallet01@gmail.com";
					too="apbanirudh@gmail.com";
					
					SendEmail se = new SendEmail();
					se.setFrom(frm);
					se.setTo(too);
					se.setSubject(subj);
					se.setMessage(msg);
					
					se.getStatus();
					
			
					pst=con.prepareStatement("insert into sendmoney(msfrom,msto,msamount,msdate,umobile) values(?,?,?,now(),?)");
					pst.setString(1, fupi);
					pst.setString(2, tupi);
					pst.setDouble(3, amount);
					pst.setString(4, umobile);
					int i=pst.executeUpdate();
					
					String adminnumber="9146226011";
					double cbamount=50.0;
					String type="UPI Payment";
					if(amount>=1000)
					{
						pst=con.prepareStatement("update kyc set wbalance=wbalance-? where umobile=?");
						pst.setDouble(1, cbamount);
						pst.setString(2, adminnumber);
						int cnt=pst.executeUpdate();
						if(cnt>0)
						{
							pst=con.prepareStatement("update kyc set wbalance=wbalance+? where umobile=?");
							pst.setDouble(1, cbamount);
							pst.setString(2, umobile);
							int j=pst.executeUpdate();
							
							if(j>0)
							{
							pst=con.prepareStatement("insert into cashback(cbtype,cbamount,cbdate,umobile) values(?,?,now(),?)");
							pst.setString(1, type);
							pst.setDouble(2, cbamount);
							pst.setString(3, umobile);
							pst.executeUpdate();
							}
							else {}
						}
						else {}
					}
					else
					{}
					
					
					if(i>0)
					{
								
						// out.println("transaction Sucessful..");
						HttpSession ses=request.getSession();
						ses.setAttribute("message", "transaction Sucessful...");
						response.sendRedirect("SendMoney.jsp");
					}
				
					
				}
				else
				{
					// out.println("transaction faield..");
					HttpSession ses=request.getSession();
					ses.setAttribute("message", "transaction faield...");
					response.sendRedirect("SendMoney.jsp");
				}
				
			}
			else
			{
				// out.println("Incorrect UPI ID...");
				HttpSession ses=request.getSession();
				ses.setAttribute("message", "Incorrect UPI ID...");
				response.sendRedirect("SendMoney.jsp");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
		
	}

}
