

class customer
{
	int amt=10000;
	synchronized public void withdrawal(int amt){
		if(this.amt<amt){
			System.out.println("Insufficient Bank Balance");
			System.out.println("Current Bank Balance:"+this.amt);
		}
		try{
		wait();
		}catch(Exception e){}
		
		System.out.println("Withdrawal Completed of Amount:"+amt);
		this.amt-=amt;
		System.out.println("Bank Balance After Withdrawal:"+this.amt);
	}
	
	synchronized public void deposite(int amt){
		
		this.amt+=amt;
		System.out.println("Successfully Deposited Of Amount:"+amt);
		System.out.println("Bank Balance After Deposition:"+this.amt);
		
		notify();
	
	}
}

class interthread{
	public static void main(String arg[]){
	
	customer c=new customer();
	
		new Thread(){
			public void run(){
				c.withdrawal(20000);
			}
		}.start();
		
		new Thread(){
			public void run(){
				c.deposite(20000);
			}
		}.start();
	
	
		
	}
}
