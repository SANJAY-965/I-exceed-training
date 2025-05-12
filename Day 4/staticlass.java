class A{
	static String name;
	static int age;
	A(String name,int age){
	this.name=name;
	this.age=age;
	}
	static class B{
		public void dis(){
		System.out.println(name+" "+age);
		}
	}
}

class staticlass{
	public static void main(String arg []){
		A obj1=new A("sanju",21);
		A.B obj2=new A.B();
		obj2.dis();
	}
}
