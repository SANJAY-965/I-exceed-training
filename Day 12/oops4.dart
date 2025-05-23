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

extension on String{
 	String display2(String a,String b,String c){
 		return a.trim().replaceAll(b,c);
 	}
}

void main(){
	Student stu =new Student("student",21);
	stu.display();
	var res=stu.display1("Bengaluru");
	print(res);
	String str="";
	var res1=str.display2("            I am a hero             ","am","will be");
	print(res1);
}
