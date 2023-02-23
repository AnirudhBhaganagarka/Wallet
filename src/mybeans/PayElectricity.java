package mybeans;

public class PayElectricity 
{
	
	private int miteru;
	private double amount;
	private double totalamt;
	private double charges;
	private String status;
	
	public PayElectricity()
	{
		miteru=0;
		amount=0.0;
		totalamt=0.0;
		charges=0.0;
		status="";
	}
	

	public int getMiteru() {
		return miteru;
	}


	public void setMiteru(int miteru) {
		this.miteru = miteru;
		electricitybill();
	}


	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}


	public double getTotalamt() {
		return totalamt;
	}


	public void setTotalamt(double totalamt) {
		this.totalamt = totalamt;
	}


	public double getCharges() {
		return charges;
	}


	public void setCharges(double charges) {
		this.charges = charges;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	private void electricitybill()
	{
		if(miteru <= 50)
		{
			amount = miteru * 0.50;
		}
		else
			if(miteru <= 150)
			{
				amount = 25 +((miteru-50) * 0.75);
			}
		else
			if(miteru <= 250)
			{
				amount = 100 + ((miteru-150) * 1.25); 
			}
			else
			{
				amount = 220 + ((miteru-250) * 1.50);
			}
		
		charges = amount * 0.20;
		totalamt = amount + charges;
		status="success";
		
	}
	
}
