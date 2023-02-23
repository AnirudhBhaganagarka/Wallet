package mybeans;

import java.sql.*;

public class MobileRecharge 
{
	private String number;
	private String operator;
	private double amount;
	private String umobile;
	private String status;
		
	public MobileRecharge()
	{
		number="";
		operator="";
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

	public void setNumber(String number) {
		this.number = number;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public void setAmount(double amount) {
		this.amount = amount;
		recharge();
	}
	
	private void recharge()
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

				pst=con.prepareStatement("insert into recharge(rnumber,roperator,ramount,rdate,umobile) values(?,?,?,now(),?)");
				pst.setString(1, number);
				pst.setString(2, operator);
				pst.setDouble(3, amount);
				pst.setString(4, umobile);
				int k= pst.executeUpdate();
				
				if(k>0)
				{
					String adminnumber="9146226011";
					double cbamount=50.0;
					String type="Mobile Recharge";
					
					if(amount>=1000)
					{
						pst=con.prepareStatement("update kyc set wbalance=wbalance-? where umobile=?");
						pst.setDouble(1, cbamount);
						pst.setString(2, adminnumber);
						int i=pst.executeUpdate();
						if(i>0)
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
		
				}
				
				status="success";				
				
			}
			else
			{
				status="faield";
			}
			con.close();
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			status="error";
		}
	}
}
