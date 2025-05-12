import mypackage.student;

class teacher1 extends student{
	String name;
	int age;
	teacher1(String name,int age){
		super(name);
		this.age=age;
	}
	
	public void tdispaly(){
		System.out.println(age);
	
	}
}

class teacher{
	public static void main(String arg[]){
		teacher1 t=new teacher1("supriya",40);
		t.tdispaly();
		t.sdisplay();
	}
}

