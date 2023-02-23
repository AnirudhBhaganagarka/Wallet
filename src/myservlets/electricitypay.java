package myservlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.PayNow;
import mybeans.SendEmail;



/**
 * Servlet implementation class electricitypay
 */
@WebServlet("/electricitypay")
public class electricitypay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public electricitypay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String state,board,consumern,billingu,umobile;
		int miteru;
		double amount;
		
		String subj;
		String msg;
		String frm;
		String too;
		
		state=request.getParameter("state");
		board=request.getParameter("bord");
		consumern=request.getParameter("consumer");
		billingu=request.getParameter("billing");
		umobile=request.getParameter("umobile");
		miteru=Integer.parseInt(request.getParameter("miter"));
		amount=Double.parseDouble(request.getParameter("amt"));
		
		
		PayNow obj=new PayNow();
		obj.setState(state);
		obj.setBoard(board);
		obj.setConsumern(consumern);
		obj.setBillingu(billingu);
		obj.setUmobile(umobile);
		obj.setMiteru(miteru);
		obj.setAmount(amount);
		String stat=obj.getStatus();
		
		if(stat.equals("success"))
		{
			subj="Electricity Payment";
			msg="Your Amount Is:-" + amount;
			frm="myonlinewallet01@gmail.com";
			too="apbanirudh@gmail.com";
			
			SendEmail se = new SendEmail();
			se.setFrom(frm);
			se.setTo(too);
			se.setSubject(subj);
			se.setMessage(msg);
			
			se.getStatus();
			
			HttpSession ses=request.getSession();
			ses.setAttribute("message", "Bill Payed Sucessfully...");
			response.sendRedirect("Electricity.jsp");
		}
		
	}

}
