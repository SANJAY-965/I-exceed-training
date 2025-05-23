class Student{

	String ?name;
	int ?age;
	
	//student(this.name,this.age);
	
	Student(String name,int age){
		this.name=name;
		this.age=age;	
	}
	void display(){
		print("I am $name with age $age");
	}
}

extension ex on Student{
  String display1(String city){
  	return "I am $name with age $age and reside in $city";
  }
}

