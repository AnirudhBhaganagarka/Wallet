package mybeans;

import java.sql.*;

public class SendUpiMoney 
{
	private String fupi;
	private String tupi;
	private double amount;
	private String status;
	
	public SendUpiMoney()
	{
		fupi="";
		tupi="";
		amount=0.0;
		status="";
	}

	
	public void setFupi(String fupi) {
		this.fupi = fupi;
	}
	
	public void setTupi(String tupi) {
		this.tupi = tupi;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
		transferamount();
	}

	public String getStatus() {
		return status;
	}

		
	private void transferamount()
	{
		Connection con;
		PreparedStatement pst;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("update kyc set wbalance=wbalance-? where wupi=?;");
			pst.setDouble(1, amount);
			pst.setString(2, fupi);
			int cnt=pst.executeUpdate();
			if(cnt>0)
			{
				pst=con.prepareStatement("update kyc set wbalance=wbalance+? where wupi=?;");
				pst.setDouble(1, amount);
				pst.setString(2, tupi);
				pst.executeUpdate();
				status="success";
			}
			else
				status="failed";
			
			con.close();
			if(amount>=1000)
			{
				String adminnumber="9146226011";
				double cbamount=50.0;
				String type="UPI Payment";
				CashBack cb=new CashBack();
				
				cb.setCbamount(cbamount);
				cb.setCbtype(type);
				cb.setUmobile(tupi);
				cb.setAdminnumber(adminnumber);
			}
			else {}			
		}
		catch(Exception e)
		{
			System.out.println(e);
			status="error";
		}
	}
	
	
	
}
