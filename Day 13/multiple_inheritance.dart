class person{
	String? name;
	int? age;
	person(String name,int age){
		//print("Welcome");
		this.name=name;
		this.age=age;
	}
	
	void display(){
		print("$name with $age");
	}
}


class student extends person{
	int ?id;
	student(String name,int age,int id):super(name,age){
		//print("thanks you");
		this.id =id;
	}
	
	void display1(){
		print("$name with $age and stu_id is $id");

	}

}

class school extends student{
	String ?schoolname;
	school(String name,int age,int id,String schoolname):super(name,age,id){
		this.schoolname=schoolname;
	}
	
	void display2(){
		print("$name with $age and stu_id is $id and studing in $schoolname");
	}
	
}

void main(){

	school s=school("Sanjay B",21,1214,"GMHSS");
	s.display();
	s.display1();
	s.display2();
}


