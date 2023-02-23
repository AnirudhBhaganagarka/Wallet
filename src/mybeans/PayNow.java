package mybeans;

import java.sql.*;

public class PayNow 
{
	private String state;
	private String board;
	private String consumern;
	private String billingu;
	private int miteru;
	private double amount;
	private String umobile;
	private String status;
	
	public PayNow()
	{
		state="";
		board="";
		consumern="";
		billingu="";
		miteru=0;
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

	public void setState(String state) {
		this.state = state;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public void setConsumern(String consumern) {
		this.consumern = consumern;
	}

	public void setBillingu(String billingu) {
		this.billingu = billingu;
	}

	public void setMiteru(int miteru) {
		this.miteru = miteru;
	}

	public void setAmount(double amount) {
		this.amount = amount;
		action();
	}
	
	private void action()
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
				pst=con.prepareStatement("insert into electricity(estate,eprovider,econsumer,ebillingu,eunit,eamount,edate,umobile) values(?,?,?,?,?,?,now(),?)");
				pst.setString(1, state);
				pst.setString(2, board);
				pst.setString(3, consumern);
				pst.setString(4, billingu);
				pst.setInt(5, miteru);
				pst.setDouble(6, amount);
				pst.setString(7, umobile);
				
				int i=pst.executeUpdate();
				if(i>0)
				{
						String adminnumber="9146226011";
						double cbamount=50.0;
						String type="Electricity Bill";
						
						if(amount>=1000)
						{
							pst=con.prepareStatement("update kyc set wbalance=wbalance-? where umobile=?");
							pst.setDouble(1, cbamount);
							pst.setString(2, adminnumber);
							int j=pst.executeUpdate();
							if(j>0)
							{
								pst=con.prepareStatement("update kyc set wbalance=wbalance+? where umobile=?");
								pst.setDouble(1, cbamount);
								pst.setString(2, umobile);
								int k=pst.executeUpdate();
								
								if(k>0)
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
						
					status="success";	
				}
				else
				{
					status="faield";
				}
				con.close();
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			status="faield";
		}
		
	}
	
}
