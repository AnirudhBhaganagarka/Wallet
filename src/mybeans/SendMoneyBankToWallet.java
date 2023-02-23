package mybeans;

import java.sql.*;

public class SendMoneyBankToWallet 
{
	private String fromacc;
	private String tupi;
	private double amount;
	private String umobile;
	private String status;
	
	
	public SendMoneyBankToWallet()
	{
		fromacc="";
		tupi="";
		amount=0.0;
		umobile="";
		status="";
	}
	

	public void setUmobile(String umobile) {
		this.umobile = umobile;
	}


	public String getStatus() {
		return status;
	}


	public void setFromacc(String fromacc) {
		this.fromacc = fromacc;
	}


	public void setTupi(String tupi) {
		this.tupi = tupi;
	}


	public void setAmount(double amount) {
		this.amount = amount;
		transferamount();
	}
	
	private void transferamount()
	{
		Connection con;
		PreparedStatement pst;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking?user=root&password=Microsoft");
			pst=con.prepareStatement("update accounts set balance=balance-? where accno=?;");
			pst.setDouble(1, amount);
			pst.setString(2, fromacc);
			int cnt=pst.executeUpdate();
			if(cnt>0)
			{
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
				pst=con.prepareStatement("update kyc set wbalance=wbalance+? where wupi=?;");
				pst.setDouble(1, amount);
				pst.setString(2, tupi);
				int i=pst.executeUpdate();
				if(i>0)
				{
					pst=con.prepareStatement("insert into addmoney(accno,amount,adddate,umobile) values(?,?,now(),?)");
					pst.setString(1, fromacc);
					pst.setDouble(2, amount);
					pst.setString(3, umobile);
					pst.executeUpdate();
				}
				status="success";
			}
			else
				status="failed";
			
			con.close();
					
		}
		catch(Exception e)
		{
			System.out.println(e);
			status="error";
		}
	}
	
}
