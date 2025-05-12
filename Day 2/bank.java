class bank1{
	String name;
	int code;
	bank1(String name,int code){
		this.name=name;
		this.code=code;
	}
	
	public void bdisplay(acc a){
	System.out.println(name+" "+code);
	System.out.println(a.acno);
	}
}

class acc{
	int acno;
	int amt;
	acc(int acno,int amt){
		this.acno=acno;
		this.amt=amt;
	}
	
	public void adisplay(bank1 b){
	System.out.println(acno+" "+amt);
	System.out.println(b.name);
	}
}

class bank{
	public static void main(String arg[]){
	bank1 b=new bank1("sbi",123);
	acc a=new acc(123456,12000);
	b.bdisplay(a);a.adisplay(b);
	}
}
