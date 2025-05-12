class A{
	private String name;
	private int age;
	A(String name,int age){
	this.name=name;
	this.age=age;
	}
	 class B{
		public void dis(){
		System.out.println(name+" "+age);
		}
	}
}

class nestedclass{
	public static void main(String arg []){
		A obj1=new A("sanju",21);
		A.B obj2=obj1.new B();
		obj2.dis();
	}
}
