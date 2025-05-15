import java.util.*;

class theater{
	int n=5;
     synchronized public void availticket(int n){
     	if(this.n<n){
     		System.out.println("There are only "+this.n+" tickets available");
     		System.out.println("Are u willing to Book Available Tickets");
     		System.out.println("For yes press 1 if no press 0");
     		try{
     		wait();
     		
     		System.out.println("Ticket for "+this.n+" seats booked Successfully");
     		
     		}catch(Exception e){}
     	}
     	else{
     	
     		System.out.println(n+" Tickets booked Successfully");
     		System.out.println("Thanks for Visting");
     	
     	}
     }
     
     synchronized public void bookticket(int n){
     		if(this.n<n){
	     		Scanner sc = new Scanner(System.in);
	     		int t=sc.nextInt();
	     		if(t==1){
	     		System.out.println("How Many Tickets Do You Need To Book From Available Ticket:");
	     		int y=sc.nextInt();
	     		this.n=y;
	     		notify();
     		}
     		
	     		else{
	     			System.out.println("Thanks for Visting");
	     			System.exit(0);
	     		}
     		}
     		
     }
}

class interthread1{
	public static void main(String arg[]){
		Scanner sc = new Scanner(System.in);
		System.out.println("How Many Tickets Do You Need To Book:");
		int n=sc.nextInt();
		theater t= new theater();
		
		new Thread(){
			public void run(){
				t.availticket(n);
				//c.withdrawal(20000);
			}
		}.start();
		
		new Thread(){
			public void run(){
				t.bookticket(n);
			}
		}.start();
	
	
	
	}
}

