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


void main(){

	student s=student("Sanjay B",21,1214);
	s.display();
	s.display1();
}


