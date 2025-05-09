class aggre{
	String name;
	int age;
	address add;
	aggre(String name,int age,address add){
		this.name=name;
		this.age=age;
		this.add=add;
	}
	public void sdisplay()
	{
		System.out.println(name+" "+age);
		add.adisplay();
	}
}

class student{
	public static void main(String arg[]){
		address add=new address("cbe",638111);
		aggre s=new aggre("sanju",21,add);
		s.sdisplay();
	}
}