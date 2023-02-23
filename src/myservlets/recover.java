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

import mybeans.SendEmail;



/**
 * Servlet implementation class recover
 */
@WebServlet("/recover")
public class recover extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recover() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String number;
		number=request.getParameter("no");
		
		String subj;
		String msg;
		String frm;
		String too;
		
		PrintWriter out=response.getWriter();
		
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
					
					subj="RecovePassword";
					msg="Your Password is:-" + rs.getString("upassword");
					frm="myonlinewallet01@gmail.com";
					too="apbanirudh@gmail.com";
					
					SendEmail obj = new SendEmail();
					obj.setFrom(frm);
					obj.setTo(too);
					obj.setSubject(subj);
					obj.setMessage(msg);
					
					String stat=obj.getStatus();
					if(stat.equals("sucess"))
					{
						HttpSession ses=request.getSession();
						ses.setAttribute("message", "password Send to your mail..");
						response.sendRedirect("RecoverPassword.jsp");
					}
				}
				else
				{
					HttpSession ses=request.getSession();
					ses.setAttribute("message", "User Dos't Exist..");
					response.sendRedirect("RecoverPassword.jsp");
				}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

}
