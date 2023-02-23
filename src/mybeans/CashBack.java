package mybeans;

import java.sql.*;

public class CashBack 
{
	private String cbtype;
	private double cbamount;
	private String umobile;
	private String status;
	private String adminnumber;
	
	public CashBack()
	{
		cbtype="";
		cbamount=0.0;
		umobile="";
		status="";
		adminnumber="";
	}
	
	public void setAdminnumber(String adminnumber) {
		this.adminnumber = adminnumber;
	}

	public String getStatus() {
		return status;
	}

	public void setCbtype(String cbtype) {
		this.cbtype = cbtype;
	}

	public void setCbamount(double cbamount) {
		this.cbamount = cbamount;
	}

	public void setUmobile(String umobile) {
		this.umobile = umobile;
		cashback();
	}
	
	private void cashback()
	{
		Connection con;
		PreparedStatement pst;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet?user=root&password=Microsoft");
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
				pst.setString(1, cbtype);
				pst.setDouble(2, cbamount);
				pst.setString(3, umobile);
				pst.executeUpdate();
				}
			}
			else
				status="failed";
			
			con.close();
	
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
}
