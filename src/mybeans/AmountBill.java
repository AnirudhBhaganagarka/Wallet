package mybeans;

public class AmountBill 
{
	private double amt;
	
	public AmountBill()
	{
		amt=0.0;
	}

	public double getAmt() {
		return amt;
	}

	public void setAmt(double amt) {
		this.amt = amt;
		showamount();
	}
	
	private void showamount()
	{
		
	}
	
}
