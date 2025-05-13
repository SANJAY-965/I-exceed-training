class a{
	
	synchronized public void dis(String msg){
		System.out.print("[");System.out.print("[");
		System.out.print(msg);
		System.out.print("]");System.out.print("]");
	}
}

class b extends Thread{
	Thread t=new Thread(this);
	String msg;
	a obj1;
	b(a obj1,String msg){
	        this.obj1=obj1;
		this.msg=msg;
		t.start();
	}
	public void run(){
			//(obj1){
			obj1.dis(msg);
			//}
		}
}

class sync{
	public static void main(String arg[]){
		a obj1 =new a();
		b obj2 = new b(obj1,"sanju");
		b obj3 = new b(obj1,"is");
		b obj4 = new b(obj1,"smart");
	}
}
