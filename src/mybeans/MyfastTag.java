package mybeans;

import java.sql.*;

public class MyfastTag 
{
	private String umobile;
	private double amount;
	private String status;
	
	public MyfastTag()
	{
		umobile="";
		amount=0.0;
		status="";
	}

	public String getStatus() {
		return status;
	}

	public void setUmobile(String umobile) {
		this.umobile = umobile;
	}

	public void setAmount(double amount) {
		this.amount = amount;
		fasttransaction();
	}
	
	private void fasttransaction()
	{
		Connection con;
		PreparedStatement pst;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
			pst=con.prepareStatement("update kyc set wbalance=wbalance-? where umobile=?");
			pst.setDouble(1, amount);
			pst.setString(2, umobile);
			int cnt=pst.executeUpdate();
			if(cnt>0)
			{
				pst=con.prepareStatement("update fasttag set fbalance=fbalance+? where umobile=?");
				pst.setDouble(1, amount);
				pst.setString(2, umobile);
				pst.executeUpdate();
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
